import * as React from "react";
import { createRoot } from "react-dom/client";
import { Navigation } from "../components/Navigation";
import { BasePage, BasePageState } from "../components/BasePage";
import { Heading } from "../components/Heading";
import { Dictionary } from "common/src/Dictionary";
import { MembershipDto } from "common/src/models/MembershipDto";
import { Form } from "../components/Form";
import { Field } from "../components/Field";
import { Select } from "../components/Select";
import { UserService } from "../services/UserService";
import { AuthService } from "../services/AuthService";
import { UserDto } from "common/src/models/UserDto";
import { UserLogic } from "../logic/UserLogic";
import { GroupDto } from "common/src/models/GroupDto";
import { SelectOption } from "../components/SelectOption";
import { GroupLogic } from "../logic/GroupLogic";
import { GroupService } from "../services/GroupService";
import { Button } from "../components/Button";
import { FlexRow } from "../components/FlexRow";
import { MembershipService } from "../services/MembershipService";
import { Checkbox } from "../components/Checkbox";

interface Props { }
interface State extends BasePageState {
    userMap: Dictionary<UserDto>;
    userOptions: React.ReactElement[];
    groupMap: Dictionary<GroupDto>;
    groupOptions: React.ReactElement[];
    models: MembershipDto[];
    selectedUser: string | null;
    selectedGroup: string | null;
}

class Page extends BasePage<Props, State> {
    public constructor(props: Props) {
        super(props);

        this.state = {
            ...BasePage.defaultState,
            userMap: {},
            userOptions: [],
            groupMap: {},
            groupOptions: [],
            models: [],
            selectedGroup: "",
            selectedUser: ""
        };
    }

    public async componentDidMount(): Promise<void> {
        await this.events.setLoading(true);

        const token = await AuthService.getToken();

        const users = await UserService.list(token);
        users.sort(UserLogic.compareEmailAddress);
        const userMap: Dictionary<UserDto> = {};
        const userOptions: React.ReactElement[] = [];
        userOptions.push(<SelectOption display="" value="" />);
        users.forEach((user) => {
            userMap[user.guid] = user;
            userOptions.push(<SelectOption display={user.emailAddress} value={user.guid} />);
        });

        const groups = await GroupService.list(token);
        groups.sort(GroupLogic.compareDisplayName);
        const groupMap: Dictionary<GroupDto> = {};
        const groupOptions: React.ReactElement[] = [];
        groupOptions.push(<SelectOption display="" value="" />);
        groups.forEach((group) => {
            groupMap[group.guid] = group;
            groupOptions.push(<SelectOption display={group.displayName} value={group.guid} />);
        });

        await this.updateState({
            userMap: userMap,
            userOptions: userOptions,
            groupMap: groupMap,
            groupOptions: groupOptions
        });

        await this.events.setLoading(false);
    }

    private async loadClicked() {
        if (!this.state.selectedGroup && !this.state.selectedUser) {
            this.events.setMessage({
                title: "Notice",
                content: "No selections for user or group were made!",
                buttons: [{ label: "OK", onClicked: () => { } }]
            });
            return;
        }

        await this.events.setLoading(true);

        const token = await AuthService.getToken();

        let memberships: MembershipDto[] = [];
        if (this.state.selectedGroup)
            memberships = await MembershipService.getForGroup(token, this.state.selectedGroup);
        else
            memberships = await MembershipService.getForUser(token, this.state.selectedUser);

        await this.updateState({ models: memberships });

        await this.events.setLoading(false);
    }

    public render(): React.ReactNode {
        const rows: React.ReactElement[] = [];
        console.log(`models: ${JSON.stringify(this.state.models, null, 4)}`);
        this.state.models.forEach((model) => {
            if (!this.state.groupMap[model.groupsGuid])
                console.log(`model.groupsGuid: ${model.groupsGuid}\nGroup Map: ${JSON.stringify(this.state.groupMap, null, 4)}`);
            if (!this.state.userMap[model.usersGuid])
                console.log(`model.usersGuid: ${model.usersGuid}\User Map: ${JSON.stringify(this.state.userMap, null, 4)}`);
            if (!this.state.groupMap[model.groupsGuid] || !this.state.userMap[model.usersGuid])
                return;

            rows.push(<tr>
                <td>{this.state.groupMap[model.groupsGuid].displayName}</td>
                <td>{this.state.userMap[model.usersGuid].emailAddress}</td>
                <td><Checkbox
                    checked={model.isIncluded}
                    onChange={async (value) => {
                        const newModels = this.jsonCopy(this.state.models);
                        newModels.forEach((newModel) => {
                            if (newModel.guid === model.guid)
                                newModel.isIncluded = value;
                        });
                        await this.updateState({ models: newModels });
                    }}
                /></td>
            </tr>);
        });

        return (
            <Navigation
                state={this.state} events={this.events}
                topMenuGuid="b1e3c680-0f62-4931-8a68-4be9b4b070f7"
                leftMenuGuid="ad90d1f8-fdd4-45e4-93b2-731f64a82c50"
            >
                <Heading level={1}>Memberships</Heading>
                <Form>
                    <Field label="User" size={3}><Select
                        value={this.state.selectedUser}
                        onChange={async (value) => {
                            await this.updateState({
                                selectedUser: value,
                                selectedGroup: ""
                            })
                        }}
                    >{this.state.userOptions}</Select></Field>
                    <Field label="Group" size={2}><Select
                        value={this.state.selectedGroup}
                        onChange={async (value) => {
                            await this.updateState({
                                selectedUser: "",
                                selectedGroup: value
                            })
                        }}
                    >{this.state.groupOptions}</Select></Field>
                </Form>
                <FlexRow gap="1em">
                    <Button label="Load" onClick={this.loadClicked.bind(this)} />
                </FlexRow>

                <table>
                    <thead>
                        <tr>
                            <th>Group</th>
                            <th>User</th>
                            <th>Included</th>
                        </tr>
                    </thead>
                    <tbody>{rows}</tbody>
                </table>
            </Navigation>
        );
    }
}

window.onload = () => {
    const element = document.getElementById('root');
    const root = createRoot(element);
    root.render(<Page />)
};
window.onpageshow = (event) => {
    if (event.persisted) {
        window.location.reload();
    }
};

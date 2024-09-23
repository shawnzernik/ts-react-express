import * as React from "react";
import { createRoot } from "react-dom/client";
import { Heading } from "../components/Heading";
import { Navigation } from "../components/Navigation";
import { BasePage, BasePageState } from "../components/BasePage";
import { Form } from "../components/Form";
import { LoginDto } from "common/src/models/LoginDto";
import { Field } from "../components/Field";
import { Input } from "../components/Input";
import { Button } from "../components/Button";
import { AuthService } from "../services/AuthService";

interface Props { }
interface State extends BasePageState {
    model: LoginDto;
}

class Page extends BasePage<Props, State> {
    public constructor(props: Props) {
        super(props);

        this.state = {
            ...BasePage.defaultState,
            model: {
                emailAddress: "",
                password: ""
            }
        };

        AuthService.setToken("");
    }

    public async login(): Promise<void> {
        await this.events.setLoading(true);

        try {
            const token = await AuthService.login(this.state.model.emailAddress, this.state.model.password);
            AuthService.setToken(token);
            window.location.assign("copyright.html");
        }
        catch (err) {
            await this.events.setMessage({
                title: "Error",
                content: `${err}`,
                buttons: [{
                    label: "OK", onClicked: () => {
                    }
                }]
            });
        }
        await this.events.setLoading(false);
    }

    public render(): React.ReactNode {
        return (
            <Navigation
                state={this.state} events={this.events}
                topMenuGuid="b9aeb1c2-4f07-4e91-bbef-25ed565b6ab3"
                leftMenuGuid="db0d6063-2266-4bfb-8c96-44dbb90cddf2"
                showMenu={false}
            >
                <Heading level={1}>Login</Heading>
                <Form>
                    <Field size={2} label="Email Address"><Input
                        value={this.state.model.emailAddress}
                        onChange={async (value) => {
                            const newModel = JSON.parse(JSON.stringify(this.state.model));
                            newModel.emailAddress = value;
                            await this.updateState({ model: newModel});
                        }}
                    /></Field>
                    <Field size={2} label="Password"><Input
                        password={true}
                        value={this.state.model.password}
                        onChange={async (value) => {
                            const newModel = JSON.parse(JSON.stringify(this.state.model));
                            newModel.password = value;
                            await this.updateState({ model: newModel});
                        }}
                    /></Field>
                </Form>
                <Form>
                    <Button label="Login" onClick={this.login.bind(this)} />
                </Form>
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

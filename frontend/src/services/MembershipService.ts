import { MembershipDto } from "common/src/models/MembershipDto";
import { FetchWrapper } from "./FetchWrapper";

export class MembershipService {
    public static async getForGroup(token: string, guid: string): Promise<MembershipDto[]> {
        const ret = await FetchWrapper.get<MembershipDto[]>("/api/v0/group/" + guid + "/memberships", token);
        return ret;
    }
    public static async getForUser(token: string, guid: string): Promise<MembershipDto[]> {
        const ret = await FetchWrapper.get<MembershipDto[]>("/api/v0/user/" + guid + "/memberships", token);
        return ret;
    }
    public static async get(token: string, guid: string): Promise<MembershipDto> {
        const ret = await FetchWrapper.get<MembershipDto>("/api/v0/membership/" + guid, token);
        return ret;
    }
    public static async list(token: string): Promise<MembershipDto[]> {
        const ret = await FetchWrapper.get<MembershipDto[]>("/api/v0/memberships", token);
        return ret;
    }

    public static async save(token: string, entity: MembershipDto): Promise<void> {
        await FetchWrapper.post("/api/v0/membership", entity, token);
    }

    public static async delete(token: string, guid: string): Promise<void> {
        await FetchWrapper.delete<MembershipDto>("/api/v0/membership/" + guid, token);
    }
}
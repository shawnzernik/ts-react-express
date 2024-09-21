import https from 'https';
import fetch from "node-fetch";
import { ListDto } from 'common/src/models/ListDto';
import { Config } from '../../Config';
import { EntitiesDataSource } from '../../data/EntitiesDataSource';
import { ListEntity } from '../../data/ListEntity';

jest.setTimeout(Config.jestTimeoutSeconds * 1000);

describe("ListService", () => {
    let agent = new https.Agent({ rejectUnauthorized: false });
    let entityGuid = "faf76b3d-ed66-4182-a7c2-7ea6562785fe";
    let entityUrlKey = "test-list";
    let token: string | undefined;
    let eds: EntitiesDataSource;

    beforeAll(async () => {
        eds = new EntitiesDataSource();
        await eds.initialize();

        const body = JSON.stringify({
            emailAddress: "administrator@localhost",
            password: "Welcome123"
        });

        const response = await fetch("https://localhost:4433/api/v0/auth/login", {
            agent: agent,
            method: "POST",
            body: body,
            headers: { "Content-Type": "application/json" }
        });

        const obj = await response.json();
        if (!response.ok)
            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);

        if (!obj["data"])
            throw new Error("Return from login did not provide a 'data' with the token!");

        token = obj["data"] as string;
    }, Config.jestTimeoutSeconds * 1000);

    afterAll(async () => {
        try { await eds.listRepository().delete({ guid: entityGuid }); }
        finally { await eds.destroy(); }
    }, Config.jestTimeoutSeconds * 1000);

    test("POST /api/v0/list - save new should return 200", async () => {
        if (!token)
            throw new Error("No token - did beforeAll() fail?");

        const entity = new ListEntity();
        entity.guid = entityGuid;
        entity.title = "Test List";
        entity.urlKey = entityUrlKey;
        entity.sql = "SELECT * FROM items;";
        entity.listUrl = "https://example.com/list";
        
        const response = await fetch("https://localhost:4433/api/v0/list", {
            agent: agent,
            method: "POST",
            body: JSON.stringify(entity),
            headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer " + token
            }
        });

        const obj = await response.json();
        if (!response.ok)
            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);

        expect(response.ok).toBeTruthy();
        expect(response.status).toBe(200);

        let reloaded = await eds.listRepository().findOneByOrFail({ guid: entityGuid });
        expect(entity).toEqual(reloaded);
    }, Config.jestTimeoutSeconds * 1000);

    test("GET /api/v0/lists should return list of lists", async () => {
        if (!token)
            throw new Error("No token - did beforeAll() fail?");

        const response = await fetch("https://localhost:4433/api/v0/lists", {
            agent: agent,
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer " + token
            }
        });

        const obj = await response.json();
        if (!response.ok)
            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);

        if (!obj["data"])
            throw new Error("No data returned!");

        const data = obj["data"] as ListDto[];

        expect(data.length > 0).toBeTruthy();
        expect(data[0].guid).toBeTruthy();
    }, Config.jestTimeoutSeconds * 1000);

    test("GET /api/v0/list/:guid should return list and 200", async () => {
        if (!token)
            throw new Error("No token - did beforeAll() fail?");

        const response = await fetch("https://localhost:4433/api/v0/list/" + entityGuid, {
            agent: agent,
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer " + token
            }
        });

        const obj = await response.json();
        if (!response.ok)
            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);

        if (!obj["data"])
            throw new Error("No data returned!");

        const data = obj["data"] as ListDto;

        expect(data.guid).toEqual(entityGuid);
    }, Config.jestTimeoutSeconds * 1000);

    test("GET /api/v0/list/url_key/:url_key should return list by URL key and 200", async () => {
        if (!token)
            throw new Error("No token - did beforeAll() fail?");

        const response = await fetch(`https://localhost:4433/api/v0/list/url_key/${entityUrlKey}`, {
            agent: agent,
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer " + token
            }
        });

        const obj = await response.json();
        if (!response.ok)
            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);

        if (!obj["data"])
            throw new Error("No data returned!");

        const data = obj["data"] as ListDto;

        expect(data.urlKey).toEqual(entityUrlKey);
    }, Config.jestTimeoutSeconds * 1000);

    test("DELETE /api/v0/list/:guid should delete list and return 200", async () => {
        if (!token)
            throw new Error("No token - did beforeAll() fail?");

        const response = await fetch("https://localhost:4433/api/v0/list/" + entityGuid, {
            agent: agent,
            method: "DELETE",
            headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer " + token
            }
        });

        const obj = await response.json();
        if (!response.ok)
            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);

        expect(response.ok).toBeTruthy();
        expect(response.status).toBe(200);

        let entity = await eds.listRepository().findBy({ guid: entityGuid });
        expect(entity.length).toEqual(0);
    }, Config.jestTimeoutSeconds * 1000);
});
import express from "express";
import { EntitiesDataSource } from "../data/EntitiesDataSource";
import { BaseService } from "./BaseService";
import { ListDto } from "common/src/models/ListDto";
import { ListEntity } from "../data/ListEntity";
import { CheckSecurity } from "./CheckSecurity";

export class ListService extends BaseService {
    public constructor(app: express.Express) {
        super();

        console.log("ListService.constructor()");

        app.get("/api/v0/list/:guid", (req, resp) => { this.methodWrapper(req, resp, this.getGuid) });
        app.get("/api/v0/list/url_key/:url_key", (req, resp) => { this.methodWrapper(req, resp, this.getUrlKey) });
        app.get("/api/v0/lists", (req, resp) => { this.methodWrapper(req, resp, this.getList) });
        app.post("/api/v0/list", (req, resp) => { this.methodWrapper(req, resp, this.postSave) });
        app.delete("/api/v0/list/:guid", (req, resp) => { this.methodWrapper(req, resp, this.deleteGuid) });
    }

    @CheckSecurity("List:Read")
    public async getGuid(req: express.Request, ds: EntitiesDataSource): Promise<ListDto | null> {
        console.log("ListService.getGuid()");
        const guid = req.params["guid"];
        const ret = await ds.listRepository().findOneBy({ guid: guid });
        return ret;
    }
    public async getUrlKey(req: express.Request, ds: EntitiesDataSource): Promise<ListDto | null> {
        console.log("ListService.getUrlKey()");
        const urlKey = req.params["url_key"];
        const ret = await ds.listRepository().findOneBy({ urlKey: urlKey });
        return ret;
    }

    @CheckSecurity("List:List")
    public async getList(req: express.Request, ds: EntitiesDataSource): Promise<ListDto[]> {
        console.log("ListService.getList()");
        const ret = await ds.listRepository().find();
        return ret;
    }

    @CheckSecurity("List:Save")
    public async postSave(req: express.Request, ds: EntitiesDataSource): Promise<void> {
        console.log("ListService.postSave()");
        const entity = new ListEntity();
        entity.copyFrom(req.body as ListDto);
        await ds.listRepository().save([entity]);
    }

    @CheckSecurity("List:Delete")
    public async deleteGuid(req: express.Request, ds: EntitiesDataSource): Promise<void> {
        console.log("ListService.deleteGuid()");
        const guid = req.params["guid"];
        await ds.listRepository().delete({ guid: guid });
    }
}
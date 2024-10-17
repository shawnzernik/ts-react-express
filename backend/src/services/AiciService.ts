import express from "express";
import { EntitiesDataSource } from "../data/EntitiesDataSource";
import { BaseService } from "./BaseService";
import { Response as AiciResponse } from "common/src/models/aici/Response";
import { AiciLogic } from "../logic/AiciLogic";
import { Logger } from "../Logger";
import { LogDto } from "common/src/models/LogDto";

/**
 * AiciService class that implements various APIs related to chat, upload, and search functionalities.
 * It extends the BaseService class and sets up the necessary routes in the Express application.
 */
export class AiciService extends BaseService {
    /**
     * Constructs an instance of AiciService.
     * 
     * @param logger - The logger instance for logging operations.
     * @param app - The Express application instance for setting up routes.
     */
    public constructor(logger: Logger, app: express.Express) {
        super();

        logger.trace();

        app.post("/api/v0/aici/chat", (req, resp) => { this.methodWrapper(req, resp, this.postChat) });
        app.post("/api/v0/aici/upload", (req, resp) => { this.methodWrapper(req, resp, this.postUpload) });
        app.get("/api/v0/aici/upload/:corelation", (req, resp) => { this.methodWrapper(req, resp, this.getUpload) });
        app.post("/api/v0/aici/search/:collection", (req, resp) => { this.methodWrapper(req, resp, this.postSearch) });
    }

    /**
     * Handles chat requests and returns a chat response.
     * 
     * @param logger - The logger instance for logging.
     * @param req - The request object containing chat data.
     * @param ds - The data source object for accessing the necessary entities.
     * @returns A promise that resolves to an AiciResponse containing the chat response.
     */
    public async postChat(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<AiciResponse> {
        await logger.trace();
        await BaseService.checkSecurity(logger, "Aici:Chat", req, ds);

        const aiResponse: AiciResponse = await AiciLogic.chat(ds, req.body);
        return aiResponse;
    }

    /**
     * Handles file upload requests. 
     * 
     * @param logger - The logger instance for logging.
     * @param req - The request object containing upload data.
     * @param ds - The data source object for accessing the necessary entities.
     * @returns A promise that resolves to void upon completion of the upload.
     */
    public async postUpload(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<void> {
        await logger.trace();
        await BaseService.checkSecurity(logger, "Aici:Upload", req, ds);

        AiciLogic.upload(logger, ds, req.body);
    }

    /**
     * Handles search requests and returns search results.
     * 
     * @param logger - The logger instance for logging.
     * @param req - The request object containing search parameters.
     * @param ds - The data source object for accessing the necessary entities.
     * @returns A promise that resolves to the search results.
     */
    public async postSearch(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<any> {
        await logger.trace();
        await BaseService.checkSecurity(logger, "Aici:Embedding", req, ds);

        const collection = req.params["collection"];
        const obj = req.body;
        if (!obj.input)
            throw new Error("No input provided!  Expected TypeScript interface: `{ input: string, limit: number }`.");
        if (!obj.limit)
            throw new Error("No input provided!  Expected TypeScript interface: `{ input: string, limit: number }`.");

        const ret = AiciLogic.search(logger, ds, collection, obj.input, obj.limit);
        return ret;
    }

    /**
     * Retrieves upload logs based on a correlation ID.
     * 
     * @param logger - The logger instance for logging.
     * @param req - The request object that contains the correlation parameter.
     * @param ds - The data source object for accessing the necessary entities.
     * @returns A promise that resolves to an array of LogDto containing the upload logs.
     */
    public async getUpload(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<LogDto[]> {
        await logger.trace();
        await BaseService.checkSecurity(logger, "Aici:Upload", req, ds);

        const corelation = req.params["corelation"];
        const ret = await AiciLogic.getUploadLogs(logger, ds, corelation);
        return ret;
    }
}

INSERT INTO prompts (guid,title,"json") VALUES
	 ('fb59e488-e57c-4d37-8092-2a122c700a82','00 Template for DTO, Entity, Repository, and Service Creation','[{"role":"user","content":"<!! FILE ~/common/src/models/UserDto.ts !!/>\n\nWhat is the name of the interface. \nProvide only the identifier and nothing else and plain text."},{"role":"assistant","content":"Equals: UserDto","refusal":null},{"role":"user","content":"<!! FILE ~/database/tables/users.sql !!/>\n\nWhat is the name of the table. \nProvide only the table name and nothing else and plain text.  \nReplace underscores with spaces."},{"role":"assistant","content":"Equals: users","refusal":null},{"role":"user","content":"Provide me the pascal case singular for the table name. \nProvide only the name and nothing else and plain text."},{"role":"assistant","content":"Equals: User","refusal":null},{"role":"user","content":"<!! FILE %INPUT_SQL% !!/>\n\nWhat is the name of the table. \nProvide only the table name and nothing else and plain text.  \nReplace underscores with spaces."},{"role":"assistant","content":"Set: TABLE_NAME","refusal":null},{"role":"user","content":"Provide me the pascal case singular for the table name. \nProvide only the name and nothing else and plain text."},{"role":"assistant","content":"Set: PASCAL_NAME","refusal":null},{"role":"user","content":"`~/common/src/models/UserDto.ts` was created from `~/database/tables/users.sql`.  \n\nCreate me a DTO for `%INPUT_SQL%`.  \nFor quoted literals in TypeScript, use double quotes (\") and not single quotes ('').\nPlease provide the output in the following format:\n\nFile name `~/folder/file.ext`:\n\n```typescript\n// code goes here\n```"},{"role":"assistant","content":"Save: DTO_NAME=File\\s*name\\s*`([~/a-zA-Z0-9\\.]*)`:\nContents: ```[a-zA-Z0-9]*\\n([\\w\\W]*)\\n```","refusal":null},{"role":"user","content":"<!! FILE ~/backend/src/data/UserEntity.ts !!/>\n\nWhat is the name of the class. \nProvide only the identifier and nothing else and plain text."},{"role":"assistant","content":"Equals: UserEntity","refusal":null},{"role":"user","content":"`~/backend/src/data/UserEntity.ts` was created from `~/common/src/models/UserDto.ts` and `~/database/tables/users.sql`.\n\nCreate a file just like was done for `~/backend/src/data/UserEntity.ts` using `%INPUT_SQL%`.\nFor quoted literals in TypeScript, use double quotes (\") and not single quotes ('').\nPlease provide the output in the following format:\n\nFile name `~/folder/file.ext`:\n\n```typescript\n// code goes here\n```\n"},{"role":"assistant","content":"Save: ENTITY_NAME=File\\s*name\\s*`([~/a-zA-Z0-9\\.]*)`:\nContents: ```[a-zA-Z0-9]*\\n([\\w\\W]*)\\n```","refusal":null},{"role":"user","content":"<!! FILE ~/backend/src/data/UserRepository.ts !!/>\n\nWhat is the name of the class. Provide only the identifier and nothing else and plain text."},{"role":"assistant","content":"Equals: UserRepository","refusal":null},{"role":"user","content":"Repository `~/backend/src/data/UserRepository.ts` was created for entity `~/backend/src/data/UserEntity.ts`.\n\nCreate a repository based on `%ENTITY_NAME%`.\nFor quoted literals in TypeScript, use double quotes (\") and not single quotes ('').\nPlease provide the output in the following format:\n\nFile name `~/folder/file.ext`:\n\n```typescript\n// code goes here\n```"},{"role":"assistant","content":"Save: RepositoryName = File\\s*name\\s*`([~/a-zA-Z0-9\\.]*)`:\nContents: RepositoryContents = ```[a-zA-Z0-9]*\\n([\\w\\W]*)\\n```","refusal":null},{"role":"user","content":"<!! FILE ~/backend/src/services/UserService.ts !!/>\n\nWhat is the name of the class. Provide only the identifier and nothing else and plain text."},{"role":"assistant","content":"Equals: UserService","refusal":null},{"role":"user","content":"`~/backend/src/services/UserService.ts` was created to provide list, get by GUID, save (upsert), and delete operations for `~/backend/src/data/UserEntity.ts`.\n\nCreate a back end service for entity `%ENTITY_NAME%` using `~/backend/src/services/UserService.ts` as an example.\nFor quoted literals in TypeScript, use double quotes (\") and not single quotes ('').\nPlease provide the output in the following format:\n\nFile name `~/folder/file.ext`:\n\n```typescript\n// code goes here\n```"},{"role":"assistant","content":"Save: BACKEND_NAME = File\\s*name\\s*`([~/a-zA-Z0-9\\.]*)`:\nContents: ```[a-zA-Z0-9]*\\n([\\w\\W]*)\\n```","refusal":null},{"role":"user","content":"<!! FILE ~/backend/src/tests/services/UserService.test.ts !!/>\n\nWhat is the name of the class being tested. Provide only the identifier and nothing else and plain text."},{"role":"assistant","content":"Equals: UserService","refusal":null},{"role":"user","content":"`~/backend/src/tests/services/UserService.test.ts` was created as end to end tests for `~/backend/src/services/UserService.ts`.\n\nCreate end to end tests for `%BACKEND_NAME%` using `~/backend/src/tests/services/UserService.test.ts` as an example.\nFor quoted literals in TypeScript, use double quotes (\") and not single quotes ('').\nPlease provide the output in the following format:\n\nFile name `~/folder/file.ext`:\n\n```typescript\n// code goes here\n```"},{"role":"assistant","content":"Save: BACKEND_TEST_NAME = File\\s*name\\s*`([~/a-zA-Z0-9\\.]*)`:\nContents: ```[a-zA-Z0-9]*\\n([\\w\\W]*)\\n```","refusal":null},{"role":"user","content":"<!! FILE ~/frontend/src/services/UserService.ts !!/>\n\nWhat is the name of the class. Provide only the identifier and nothing else and plain text."},{"role":"assistant","content":"Equals: UserService","refusal":null},{"role":"user","content":"`~/frontend/src/services/UserService.ts` is the font end service created to call the back end service `~/backend/src/services/UserService.ts`.\n\nCreate a front end service for `%BACKEND_NAME%` using `~/frontend/src/services/UserService.ts` as an example."},{"role":"assistant","content":"Save: FRONTEND_NAME = File\\s*name\\s*`([~/a-zA-Z0-9\\.]*)`:\nContents: ```[a-zA-Z0-9]*\\n([\\w\\W]*)\\n```","refusal":null}]'),
	 ('0c9963a3-2094-4e1c-a6ca-f9e8eef1bc0f','00 Template','[{"role":"user","content":"File name `~/common/src/models/UserDto.ts`:\n\n```typescript\nexport interface UserDto {\n    guid: string;\n    displayName: string;\n    emailAddress: string;\n    smsPhone: string;\n}\n```\n\nWhat is the name of the interface. \nProvide only the identifier and nothing else and plain text."},{"role":"assistant","content":"UserDto","refusal":null},{"role":"user","content":"File name `~/database/tables/users.sql`:\n\n```sql\nCREATE TABLE \"users\" (\n\t\"guid\" UUID PRIMARY KEY,\n\n\t\"display_name\" VARCHAR(100) NOT NULL,\n\t\"email_address\" VARCHAR(250) NOT NULL,\n\t\"sms_phone\" VARCHAR(20) NOT NULL\n);\n\nALTER TABLE \"users\" ADD CONSTRAINT \"uk_users_email_address\" UNIQUE (\"email_address\");\n```\n\nWhat is the name of the table. \nProvide only the table name and nothing else and plain text.  \nReplace underscores with spaces."},{"role":"assistant","content":"users","refusal":null},{"role":"user","content":"Provide me the pascal case singular for the table name. \nProvide only the name and nothing else and plain text."},{"role":"assistant","content":"User","refusal":null},{"role":"user","content":"File name `~/database/tables/prompts.sql`:\n\n```sql\nCREATE TABLE \"prompts\" ( \n    \"guid\" UUID PRIMARY KEY,\n    \"title\" VARCHAR(1024) NOT NULL,\n    \"markdown\" TEXT NOT NULL\n)\n```\n\nWhat is the name of the table. \nProvide only the table name and nothing else and plain text.  \nReplace underscores with spaces."},{"role":"assistant","content":"prompts","refusal":null},{"role":"user","content":"Provide me the pascal case singular for the table name. \nProvide only the name and nothing else and plain text."},{"role":"assistant","content":"Prompt","refusal":null},{"role":"user","content":"`~/common/src/models/UserDto.ts` was created from `~/database/tables/users.sql`.  \n\nCreate me a DTO for `~/database/tables/prompts.sql`.  \nFor quoted literals in TypeScript, use double quotes (\") and not single quotes ('').\nPlease provide the output in the following format:\n\nFile name `~/folder/file.ext`:\n\n```typescript\n// code goes here\n```"},{"role":"assistant","content":"File name `~/common/src/models/PromptDto.ts`:\n\n```typescript\nexport interface PromptDto {\n    guid: string;\n    title: string;\n    markdown: string;\n}\n```","refusal":null},{"role":"user","content":"File name: `~/backend/src/data/UserEntity.ts`:\n\n```typescript\nimport { Entity, PrimaryColumn, Column } from \"typeorm\";\nimport { CopyInterface } from \"common/src/logic/CopyInterface\";\nimport { UserDto } from \"common/src/models/UserDto\";\n\n@Entity(\"users\")\nexport class UserEntity implements UserDto, CopyInterface<UserDto> {\n\t@PrimaryColumn({ name: \"guid\" })\n\tpublic guid: string = \"\";\n\n\t@Column({ name: \"display_name\" })\n\tpublic displayName: string = \"\";\n\n\t@Column({ name: \"email_address\" })\n\tpublic emailAddress: string = \"\";\n\n\t@Column({ name: \"sms_phone\" })\n\tpublic smsPhone: string = \"\";\n\n\tpublic copyFrom(source: UserDto): void {\n\t\tthis.guid = source.guid;\n\t\tthis.displayName = source.displayName;\n\t\tthis.emailAddress = source.emailAddress;\n\t\tthis.smsPhone = source.smsPhone;\n\t}\n\tpublic copyTo(dest: UserDto): void {\n\t\tdest.guid = this.guid;\n\t\tdest.displayName = this.displayName;\n\t\tdest.emailAddress = this.emailAddress;\n\t\tdest.smsPhone = this.smsPhone;\n\t}\n}\n```\n\nWhat is the name of the class. \nProvide only the identifier and nothing else and plain text."},{"role":"assistant","content":"UserEntity","refusal":null},{"role":"user","content":"`~/backend/src/data/UserEntity.ts` was created from `~/common/src/models/UserDto.ts` and `~/database/tables/users.sql`.\n\nCreate a file just like was done for `~/backend/src/data/UserEntity.ts` using `~/database/tables/prompts.sql`.\nFor quoted literals in TypeScript, use double quotes (\") and not single quotes ('').\nPlease provide the output in the following format:\n\nFile name `~/folder/file.ext`:\n\n```typescript\n// code goes here\n```\n"},{"role":"assistant","content":"File name `~/backend/src/data/PromptEntity.ts`:\n\n```typescript\nimport { Entity, PrimaryColumn, Column } from \"typeorm\";\nimport { CopyInterface } from \"common/src/logic/CopyInterface\";\nimport { PromptDto } from \"common/src/models/PromptDto\";\n\n@Entity(\"prompts\")\nexport class PromptEntity implements PromptDto, CopyInterface<PromptDto> {\n    @PrimaryColumn({ name: \"guid\" })\n    public guid: string = \"\";\n\n    @Column({ name: \"title\" })\n    public title: string = \"\";\n\n    @Column({ name: \"markdown\" })\n    public markdown: string = \"\";\n\n    public copyFrom(source: PromptDto): void {\n        this.guid = source.guid;\n        this.title = source.title;\n        this.markdown = source.markdown;\n    }\n\n    public copyTo(dest: PromptDto): void {\n        dest.guid = this.guid;\n        dest.title = this.title;\n        dest.markdown = this.markdown;\n    }\n}\n```","refusal":null},{"role":"user","content":"File name `~/backend/src/data/UserRepository.ts`:\n\n```\nimport { Repository } from ''typeorm'';\nimport { UserEntity } from ''./UserEntity'';\n\nexport class UserRepository extends Repository<UserEntity> {\n}\n```\n\nWhat is the name of the class. Provide only the identifier and nothing else and plain text."},{"role":"assistant","content":"UserRepository","refusal":null},{"role":"user","content":"`~/backend/src/data/UserRepository.ts` was created for `~/backend/src/data/UserEntity.ts`.\n\nCreate a repository based on `~/backend/src/data/PromptEntity.ts`.\nFor quoted literals in TypeScript, use double quotes (\") and not single quotes ('').\nPlease provide the output in the following format:\n\nFile name `~/folder/file.ext`:\n\n```typescript\n// code goes here\n```"},{"role":"assistant","content":"File name `~/backend/src/data/PromptRepository.ts`:\n\n```typescript\nimport { Repository } from \"typeorm\";\nimport { PromptEntity } from \"./PromptEntity\";\n\nexport class PromptRepository extends Repository<PromptEntity> {\n}\n```","refusal":null},{"role":"user","content":"File name: `~/backend/src/services/UserService.ts`\n\n```\nimport express from \"express\";\nimport { EntitiesDataSource } from \"../data/EntitiesDataSource\";\nimport { BaseService } from \"./BaseService\";\nimport { UserDto } from \"common/src/models/UserDto\";\nimport { UserEntity } from \"../data/UserEntity\";\nimport { PasswordLogic } from \"../logic/PasswordLogic\";\nimport { Logger } from \"../Logger\";\n\nexport class UserService extends BaseService {\n    public constructor(logger: Logger, app: express.Express) {\n        super();\n\n        logger.trace();\n\n        app.get(\"/api/v0/user/:guid\", (req, resp) => { this.methodWrapper(req, resp, this.getGuid) });\n        app.get(\"/api/v0/users\", (req, resp) => { this.methodWrapper(req, resp, this.getList) });\n        app.post(\"/api/v0/user\", (req, resp) => { this.methodWrapper(req, resp, this.postSave) });\n        app.delete(\"/api/v0/user/:guid\", (req, resp) => { this.methodWrapper(req, resp, this.deleteGuid) });\n        app.post(\"/api/v0/user/:guid/password\", (req, resp) => { this.methodWrapper(req, resp, this.postPassword) });\n    }\n\n    public async getGuid(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<UserDto | null> {\n        await logger.trace();\n        await BaseService.checkSecurity(logger, \"User:Read\", req, ds);\n\n        const guid = req.params[\"guid\"];\n        const ret = await ds.userRepository().findOneBy({ guid: guid });\n        return ret;\n    }\n    public async getList(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<UserDto[]> {\n        await logger.trace();\n        await BaseService.checkSecurity(logger, \"User:List\", req, ds);\n\n        const ret = await ds.userRepository().find();\n        return ret;\n    }\n    public async postSave(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<void> {\n        await logger.trace();\n        await BaseService.checkSecurity(logger, \"User:Save\", req, ds);\n\n        const entity = new UserEntity();\n        entity.copyFrom(req.body as UserDto);\n        await ds.userRepository().save([entity]);\n    }\n    public async deleteGuid(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<void> {\n        await logger.trace();\n        await BaseService.checkSecurity(logger, \"User:Delete\", req, ds);\n\n        const guid = req.params[\"guid\"];\n        await ds.userRepository().delete({ guid: guid });\n    }\n    public async postPassword(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<void> {\n        await logger.trace();\n        await BaseService.checkSecurity(logger, \"User:Password\", req, ds);\n\n        const guid = req.params[\"guid\"];\n\n        const passLogic = new PasswordLogic();\n        const passEntity = await passLogic.reset(ds, guid, req.body[\"password\"], req.body[\"confirm\"]);\n        await ds.passwordRepository().save(passEntity);\n    }\n}\n```\n\nWhat is the name of the class. Provide only the identifier and nothing else and plain text."},{"role":"assistant","content":"UserService","refusal":null},{"role":"user","content":"`~/backend/src/services/UserService.ts` was created to provide list, get by GUID, save (upsert), and delete operations for `~/backend/src/data/UserEntity.ts`.\n\nCreate a back end service for `~/backend/src/data/UserEntity.ts` using `~/backend/src/services/UserService.ts` as an example.\nFor quoted literals in TypeScript, use double quotes (\") and not single quotes ('').\nPlease provide the output in the following format:\n\nFile name `~/folder/file.ext`:\n\n```typescript\n// code goes here\n```"},{"role":"assistant","content":"File name `~/backend/src/services/PromptService.ts`:\n\n```typescript\nimport express from \"express\";\nimport { EntitiesDataSource } from \"../data/EntitiesDataSource\";\nimport { BaseService } from \"./BaseService\";\nimport { PromptDto } from \"common/src/models/PromptDto\";\nimport { PromptEntity } from \"../data/PromptEntity\";\nimport { Logger } from \"../Logger\";\n\nexport class PromptService extends BaseService {\n    public constructor(logger: Logger, app: express.Express) {\n        super();\n\n        logger.trace();\n\n        app.get(\"/api/v0/prompt/:guid\", (req, resp) => { this.methodWrapper(req, resp, this.getGuid) });\n        app.get(\"/api/v0/prompts\", (req, resp) => { this.methodWrapper(req, resp, this.getList) });\n        app.post(\"/api/v0/prompt\", (req, resp) => { this.methodWrapper(req, resp, this.postSave) });\n        app.delete(\"/api/v0/prompt/:guid\", (req, resp) => { this.methodWrapper(req, resp, this.deleteGuid) });\n    }\n\n    public async getGuid(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<PromptDto | null> {\n        await logger.trace();\n        await BaseService.checkSecurity(logger, \"Prompt:Read\", req, ds);\n\n        const guid = req.params[\"guid\"];\n        const ret = await ds.promptRepository().findOneBy({ guid: guid });\n        return ret;\n    }\n\n    public async getList(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<PromptDto[]> {\n        await logger.trace();\n        await BaseService.checkSecurity(logger, \"Prompt:List\", req, ds);\n\n        const ret = await ds.promptRepository().find();\n        return ret;\n    }\n\n    public async postSave(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<void> {\n        await logger.trace();\n        await BaseService.checkSecurity(logger, \"Prompt:Save\", req, ds);\n\n        const entity = new PromptEntity();\n        entity.copyFrom(req.body as PromptDto);\n        await ds.promptRepository().save([entity]);\n    }\n\n    public async deleteGuid(logger: Logger, req: express.Request, ds: EntitiesDataSource): Promise<void> {\n        await logger.trace();\n        await BaseService.checkSecurity(logger, \"Prompt:Delete\", req, ds);\n\n        const guid = req.params[\"guid\"];\n        await ds.promptRepository().delete({ guid: guid });\n    }\n}\n```","refusal":null},{"role":"user","content":"File name: `~/backend/src/tests/services/UserService.test.ts`:\n\n```\nimport https from ''https'';\nimport fetch from \"node-fetch\";\nimport { UserDto } from ''common/src/models/UserDto'';\nimport { Config } from ''../../Config'';\nimport { EntitiesDataSource } from ''../../data/EntitiesDataSource'';\nimport { UserEntity } from ''../../data/UserEntity'';\n\njest.setTimeout(Config.jestTimeoutSeconds * 1000);\n\ndescribe(\"UserService\", () => {\n    let agent = new https.Agent({ rejectUnauthorized: false });\n    let entityGuid = \"faf76b3d-ed66-4182-a7c2-7ea6562785fe\";\n    let token: string | undefined;\n    let eds: EntitiesDataSource;\n\n    beforeAll(async () => {\n        eds = new EntitiesDataSource();\n        await eds.initialize();\n\n        const body = JSON.stringify({\n            emailAddress: \"administrator@localhost\",\n            password: \"Welcome123\"\n        });\n\n        const response = await fetch(\"https://localhost:4433/api/v0/auth/login\", {\n            agent: agent,\n            method: \"POST\",\n            body: body,\n            headers: { \"Content-Type\": \"application/json\" }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        if (!obj[\"data\"])\n            throw new Error(\"Return from login did not provide a ''data'' with the token!\");\n\n        token = obj[\"data\"] as string;\n    }, Config.jestTimeoutSeconds * 1000);\n    afterAll(async () => {\n        try { await eds.userRepository().delete({ guid: entityGuid }); }\n        finally { await eds.destroy(); }\n    }, Config.jestTimeoutSeconds * 1000);\n\n    test(\"POST /api/v0/user - save new should return 200\", async () => {\n        if (!token)\n            throw new Error(\"No token - did beforeAll() fail?\");\n\n        const entity = new UserEntity();\n        entity.guid = entityGuid;\n        entity.displayName = \"Delete Me\";\n        entity.emailAddress = \"deleteme@localhost\";\n        entity.smsPhone = \"555-555-5555\";\n\n        const response = await fetch(\"https://localhost:4433/api/v0/user\", {\n            agent: agent,\n            method: \"POST\",\n            body: JSON.stringify(entity),\n            headers: {\n                \"Content-Type\": \"application/json\",\n                \"Authorization\": \"Bearer \" + token\n            }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        expect(response.ok).toBeTruthy();\n        expect(response.status).toBe(200);\n\n        let reloaded = await eds.userRepository().findOneByOrFail({ guid: entityGuid });\n        expect(entity).toEqual(reloaded);\n    }, Config.jestTimeoutSeconds * 1000);\n    test(\"POST /api/v0/user overwrite should return 200\", async () => {\n        if (!token)\n            throw new Error(\"No token - did beforeAll() fail?\");\n\n        const entity = new UserEntity();\n        entity.guid = entityGuid;\n        entity.displayName = \"Delete Me Dupe\";\n        entity.emailAddress = \"deleteme@localhost\";\n        entity.smsPhone = \"555-555-5555\";\n\n        const response = await fetch(\"https://localhost:4433/api/v0/user\", {\n            agent: agent,\n            method: \"POST\",\n            body: JSON.stringify(entity),\n            headers: {\n                \"Content-Type\": \"application/json\",\n                \"Authorization\": \"Bearer \" + token\n            }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        expect(response.ok).toBeTruthy();\n        expect(response.status).toBe(200);\n\n        let reloaded = await eds.userRepository().findOneByOrFail({ guid: entityGuid });\n        expect(entity).toEqual(reloaded);\n    }, Config.jestTimeoutSeconds * 1000);\n    test(\"GET /api/v0/users should return user list\", async () => {\n        if (!token)\n            throw new Error(\"No token - did beforeAll() fail?\");\n\n        const response = await fetch(\"https://localhost:4433/api/v0/users\", {\n            agent: agent,\n            method: \"GET\",\n            headers: {\n                \"Content-Type\": \"application/json\",\n                \"Authorization\": \"Bearer \" + token\n            }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        if (!obj[\"data\"])\n            throw new Error(\"No data returned!\");\n\n        const data = obj[\"data\"] as UserDto[];\n\n        expect(data.length > 0).toBeTruthy();\n        expect(data[0].guid).toBeTruthy();\n    }, Config.jestTimeoutSeconds * 1000);\n    test(\"GET /api/v0/user/:guid should return user and 200\", async () => {\n        if (!token)\n            throw new Error(\"No token - did beforeAll() fail?\");\n\n        const response = await fetch(\"https://localhost:4433/api/v0/user/\" + entityGuid, {\n            agent: agent,\n            method: \"GET\",\n            headers: {\n                \"Content-Type\": \"application/json\",\n                \"Authorization\": \"Bearer \" + token\n            }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        if (!obj[\"data\"])\n            throw new Error(\"No data returned!\");\n\n        const data = obj[\"data\"] as UserDto;\n\n        expect(data.guid).toEqual(entityGuid);\n    }, Config.jestTimeoutSeconds * 1000);\n    test(\"DELETE /api/v0/user/:guid should delete user and return 200\", async () => {\n        if (!token)\n            throw new Error(\"No token - did beforeAll() fail?\");\n\n        const response = await fetch(\"https://localhost:4433/api/v0/user/\" + entityGuid, {\n            agent: agent,\n            method: \"DELETE\",\n            headers: {\n                \"Content-Type\": \"application/json\",\n                \"Authorization\": \"Bearer \" + token\n            }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        expect(response.ok).toBeTruthy();\n        expect(response.status).toBe(200);\n\n        let entity = await eds.userRepository().findBy({ guid: entityGuid });\n        expect(entity.length).toEqual(0);\n    }, Config.jestTimeoutSeconds * 1000);\n});\n```\n\nWhat is the name of the class being tested. Provide only the identifier and nothing else and plain text."},{"role":"assistant","content":"UserService","refusal":null},{"role":"user","content":"`~/backend/src/tests/services/UserService.test.ts` was created as end to end tests for `~/backend/src/services/UserService.ts`.\n\nCreate end to end tests for `~/backend/src/services/PromptService.ts` using `~/backend/src/tests/services/UserService.test.ts` as an example.\nFor quoted literals in TypeScript, use double quotes (\") and not single quotes ('').\nPlease provide the output in the following format:\n\nFile name `~/folder/file.ext`:\n\n```typescript\n// code goes here\n```"},{"role":"assistant","content":"File name `~/backend/src/tests/services/PromptService.test.ts`:\n\n```typescript\nimport https from \"https\";\nimport fetch from \"node-fetch\";\nimport { PromptDto } from \"common/src/models/PromptDto\";\nimport { Config } from \"../../Config\";\nimport { EntitiesDataSource } from \"../../data/EntitiesDataSource\";\nimport { PromptEntity } from \"../../data/PromptEntity\";\n\njest.setTimeout(Config.jestTimeoutSeconds * 1000);\n\ndescribe(\"PromptService\", () => {\n    let agent = new https.Agent({ rejectUnauthorized: false });\n    let entityGuid = \"e6da051a-7c71-4d6c-bf84-f78e91b8ae26\";\n    let token: string | undefined;\n    let eds: EntitiesDataSource;\n\n    beforeAll(async () => {\n        eds = new EntitiesDataSource();\n        await eds.initialize();\n\n        const body = JSON.stringify({\n            emailAddress: \"administrator@localhost\",\n            password: \"Welcome123\"\n        });\n\n        const response = await fetch(\"https://localhost:4433/api/v0/auth/login\", {\n            agent: agent,\n            method: \"POST\",\n            body: body,\n            headers: { \"Content-Type\": \"application/json\" }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        if (!obj[\"data\"])\n            throw new Error(\"Return from login did not provide a ''data'' with the token!\");\n\n        token = obj[\"data\"] as string;\n    }, Config.jestTimeoutSeconds * 1000);\n\n    afterAll(async () => {\n        try { await eds.promptRepository().delete({ guid: entityGuid }); }\n        finally { await eds.destroy(); }\n    }, Config.jestTimeoutSeconds * 1000);\n\n    test(\"POST /api/v0/prompt - save new should return 200\", async () => {\n        if (!token)\n            throw new Error(\"No token - did beforeAll() fail?\");\n\n        const entity = new PromptEntity();\n        entity.guid = entityGuid;\n        entity.title = \"Test Prompt\";\n        entity.markdown = \"This is a test prompt.\";\n\n        const response = await fetch(\"https://localhost:4433/api/v0/prompt\", {\n            agent: agent,\n            method: \"POST\",\n            body: JSON.stringify(entity),\n            headers: {\n                \"Content-Type\": \"application/json\",\n                \"Authorization\": \"Bearer \" + token\n            }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        expect(response.ok).toBeTruthy();\n        expect(response.status).toBe(200);\n\n        let reloaded = await eds.promptRepository().findOneByOrFail({ guid: entityGuid });\n        expect(entity).toEqual(reloaded);\n    }, Config.jestTimeoutSeconds * 1000);\n\n    test(\"POST /api/v0/prompt overwrite should return 200\", async () => {\n        if (!token)\n            throw new Error(\"No token - did beforeAll() fail?\");\n\n        const entity = new PromptEntity();\n        entity.guid = entityGuid;\n        entity.title = \"Updated Test Prompt\";\n        entity.markdown = \"This is an updated test prompt.\";\n\n        const response = await fetch(\"https://localhost:4433/api/v0/prompt\", {\n            agent: agent,\n            method: \"POST\",\n            body: JSON.stringify(entity),\n            headers: {\n                \"Content-Type\": \"application/json\",\n                \"Authorization\": \"Bearer \" + token\n            }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        expect(response.ok).toBeTruthy();\n        expect(response.status).toBe(200);\n\n        let reloaded = await eds.promptRepository().findOneByOrFail({ guid: entityGuid });\n        expect(entity).toEqual(reloaded);\n    }, Config.jestTimeoutSeconds * 1000);\n\n    test(\"GET /api/v0/prompts should return prompt list\", async () => {\n        if (!token)\n            throw new Error(\"No token - did beforeAll() fail?\");\n\n        const response = await fetch(\"https://localhost:4433/api/v0/prompts\", {\n            agent: agent,\n            method: \"GET\",\n            headers: {\n                \"Content-Type\": \"application/json\",\n                \"Authorization\": \"Bearer \" + token\n            }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        if (!obj[\"data\"])\n            throw new Error(\"No data returned!\");\n\n        const data = obj[\"data\"] as PromptDto[];\n\n        expect(data.length > 0).toBeTruthy();\n        expect(data[0].guid).toBeTruthy();\n    }, Config.jestTimeoutSeconds * 1000);\n\n    test(\"GET /api/v0/prompt/:guid should return prompt and 200\", async () => {\n        if (!token)\n            throw new Error(\"No token - did beforeAll() fail?\");\n\n        const response = await fetch(\"https://localhost:4433/api/v0/prompt/\" + entityGuid, {\n            agent: agent,\n            method: \"GET\",\n            headers: {\n                \"Content-Type\": \"application/json\",\n                \"Authorization\": \"Bearer \" + token\n            }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        if (!obj[\"data\"])\n            throw new Error(\"No data returned!\");\n\n        const data = obj[\"data\"] as PromptDto;\n\n        expect(data.guid).toEqual(entityGuid);\n    }, Config.jestTimeoutSeconds * 1000);\n\n    test(\"DELETE /api/v0/prompt/:guid should delete prompt and return 200\", async () => {\n        if (!token)\n            throw new Error(\"No token - did beforeAll() fail?\");\n\n        const response = await fetch(\"https://localhost:4433/api/v0/prompt/\" + entityGuid, {\n            agent: agent,\n            method: \"DELETE\",\n            headers: {\n                \"Content-Type\": \"application/json\",\n                \"Authorization\": \"Bearer \" + token\n            }\n        });\n\n        const obj = await response.json();\n        if (!response.ok)\n            throw new Error(`Response: ${response.status} - ${response.statusText} - ${obj.error}`);\n\n        expect(response.ok).toBeTruthy();\n        expect(response.status).toBe(200);\n\n        let entity = await eds.promptRepository().findBy({ guid: entityGuid });\n        expect(entity.length).toEqual(0);\n    }, Config.jestTimeoutSeconds * 1000);\n});\n```","refusal":null},{"role":"user","content":"File name `~/frontend/src/services/UserService.ts`:\n\n```typescript\nimport { UserDto } from \"common/src/models/UserDto\";\nimport { FetchWrapper } from \"./FetchWrapper\";\nimport { UUIDv4 } from \"common/src/logic/UUIDv4\";\n\nexport class UserService {\n    public static async get(token: string, guid: string): Promise<UserDto> {\n        const ret = await FetchWrapper.get<UserDto>({\n            url: \"/api/v0/user/\" + guid,\n            corelation: UUIDv4.generate(),\n            token: token\n        });\n        return ret;\n    }\n\n    public static async list(token: string): Promise<UserDto[]> {\n        const ret = await FetchWrapper.get<UserDto[]>({\n            url: \"/api/v0/users\",\n            corelation: UUIDv4.generate(),\n            token: token\n        });\n        return ret;\n    }\n\n    public static async save(token: string, dto: UserDto): Promise<void> {\n        await FetchWrapper.post({\n            url: \"/api/v0/user\",\n            body: dto,\n            corelation: UUIDv4.generate(),\n            token: token\n        });\n    }\n\n    public static async delete(token: string, guid: string): Promise<void> {\n        await FetchWrapper.delete({\n            url: \"/api/v0/user/\" + guid,\n            corelation: UUIDv4.generate(),\n            token: token\n        });\n    }\n    public static async resetPassword(token: string, guid: string, newPassword: string, confirmPassword: string): Promise<void> {\n        const obj = { password: newPassword, confirm: confirmPassword };\n        await FetchWrapper.post({\n            url: \"/api/v0/user/\" + guid + \"/password\",\n            body: obj,\n            corelation: UUIDv4.generate(),\n            token: token\n        });\n    }\n}\n```\n\nWhat is the name of the class. Provide only the identifier and nothing else and plain text."},{"role":"assistant","content":"UserService","refusal":null},{"role":"user","content":"`~/frontend/src/services/UserService.ts` is the font end service created to call the back end service `~/backend/src/services/UserService.ts`.\n\nCreate a front end service for `~/backend/src/services/PromptService.ts` using `~/frontend/src/services/UserService.ts` as an example."},{"role":"assistant","content":"File name `~/frontend/src/services/PromptService.ts`:\n\n```typescript\nimport { PromptDto } from \"common/src/models/PromptDto\";\nimport { FetchWrapper } from \"./FetchWrapper\";\nimport { UUIDv4 } from \"common/src/logic/UUIDv4\";\n\nexport class PromptService {\n    public static async get(token: string, guid: string): Promise<PromptDto> {\n        const ret = await FetchWrapper.get<PromptDto>({\n            url: \"/api/v0/prompt/\" + guid,\n            corelation: UUIDv4.generate(),\n            token: token\n        });\n        return ret;\n    }\n\n    public static async list(token: string): Promise<PromptDto[]> {\n        const ret = await FetchWrapper.get<PromptDto[]>({\n            url: \"/api/v0/prompts\",\n            corelation: UUIDv4.generate(),\n            token: token\n        });\n        return ret;\n    }\n\n    public static async save(token: string, dto: PromptDto): Promise<void> {\n        await FetchWrapper.post({\n            url: \"/api/v0/prompt\",\n            body: dto,\n            corelation: UUIDv4.generate(),\n            token: token\n        });\n    }\n\n    public static async delete(token: string, guid: string): Promise<void> {\n        await FetchWrapper.delete({\n            url: \"/api/v0/prompt/\" + guid,\n            corelation: UUIDv4.generate(),\n            token: token\n        });\n    }\n}\n```","refusal":null}]');

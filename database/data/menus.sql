CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DO $$
DECLARE
    parents_guid UUID;
BEGIN

    INSERT INTO "menus" ("guid", "parents_guid", "order", "display", "bootstrap_icon", "url") VALUES
    ('b9aeb1c2-4f07-4e91-bbef-25ed565b6ab3', NULL, 1, 'Session', 'person-fill', ''),
    ('db0d6063-2266-4bfb-8c96-44dbb90cddf2', 'b9aeb1c2-4f07-4e91-bbef-25ed565b6ab3', 1, 'Login', 'door-open-fill', '/static/pages/login.html'),
    ('ff3f0659-050e-4d60-97df-84cbfbd90c62', 'b9aeb1c2-4f07-4e91-bbef-25ed565b6ab3', 2, 'Logout', 'door-closed-fill', '/static/pages/login.html'),
    ('5a8a209b-e6c1-42e4-8bc9-f144feec6d8e', 'b9aeb1c2-4f07-4e91-bbef-25ed565b6ab3', 3, 'Copyright', 'c-circle-fill', '/static/pages/copyright.html'),
    ('c30341f3-f40e-4f94-96e5-1e63f9ac899e', 'b9aeb1c2-4f07-4e91-bbef-25ed565b6ab3', 4, 'Account', 'person-vcard', '/static/pages/account.html'),
    ('4fa7b2ae-953d-45ed-bc83-2194176b0c59', 'b9aeb1c2-4f07-4e91-bbef-25ed565b6ab3', 5, 'Help', 'question-circle-fill', '/static/pages/help.html'),

    ('a4b3b92f-3037-4780-a5c2-3d9d85d6b5a4', NULL, 2, 'OpenAI Aici', 'fire', ''),
    ('1a5073f4-5be7-4b01-af23-11aff07485f3', 'a4b3b92f-3037-4780-a5c2-3d9d85d6b5a4', 1, 'Fine Tune', 'easel-fill', '/static/pages/finetune.html'),
    ('b3d886a8-dd3d-426a-9ddf-1e18cbb7e224', 'a4b3b92f-3037-4780-a5c2-3d9d85d6b5a4', 2, 'Chat', 'chat-fill', '/static/pages/chat.html'),
    ('6b8c801f-c6f9-42d6-8502-c2ea75287f26', 'a4b3b92f-3037-4780-a5c2-3d9d85d6b5a4', 3, 'Datasets', 'backpack-fill', '/static/pages/lists.html?url_key=datasets'),

    ('b1e3c680-0f62-4931-8a68-4be9b4b070f7', NULL, 3, 'System', 'gear-fill', ''),
    ('67fa4231-5b8e-4639-89cb-5f15a9207a83', 'b1e3c680-0f62-4931-8a68-4be9b4b070f7', 1, 'Users', 'people-fill', '/static/pages/lists.html?url_key=users'),
    ('d7db605a-ec82-4da6-8fae-df4d5bfb173d', 'b1e3c680-0f62-4931-8a68-4be9b4b070f7', 2, 'Groups', 'diagram-3-fill', '/static/pages/lists.html?url_key=groups'),
    ('46c065f9-16cc-4b8b-9f22-421177576460', 'b1e3c680-0f62-4931-8a68-4be9b4b070f7', 3, 'Securables', 'lock-fill', '/static/pages/lists.html?url_key=securables'),
    ('ad90d1f8-fdd4-45e4-93b2-731f64a82c50', 'b1e3c680-0f62-4931-8a68-4be9b4b070f7', 4, 'Memberships', 'clipboard-check-fill', '/static/pages/memberships.html'),
    ('9cba8197-65ed-42ed-a37c-f8a4e2f774e2', 'b1e3c680-0f62-4931-8a68-4be9b4b070f7', 5, 'Permissions', 'shield-lock-fill', '/static/pages/permissions.html'),
    ('35697b22-5894-44e7-b574-d0cf7f63af80', 'b1e3c680-0f62-4931-8a68-4be9b4b070f7', 6, 'Menus', 'list', '/static/pages/lists.html?url_key=menus'),
    ('e1b4b1c6-0c4f-4a62-9c8f-8c8f3b9a4d61', 'b1e3c680-0f62-4931-8a68-4be9b4b070f7', 7, 'Lists', 'table', '/static/pages/lists.html?url_key=lists'),
    ('ac781ba3-dd39-4c4f-a68b-4894d733cccb', 'b1e3c680-0f62-4931-8a68-4be9b4b070f7', 8, 'Settings', 'gear-fill', '/static/pages/lists.html?url_key=settings');

    INSERT INTO "securables" ("guid", "display_name")
    SELECT 
        m.guid,
        CASE
            WHEN m.parents_guid IS NULL THEN CONCAT('Menu:', m.display)
            ELSE CONCAT(
                'Menu:Item:',
                COALESCE(
                    (SELECT p.display FROM "menus" p WHERE m.parents_guid = p.guid LIMIT 1),
                    'MISSING'
                ),
                ':',
                m.display
            )
        END
    FROM "menus" m;

END $$;
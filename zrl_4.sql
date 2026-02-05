-- ============ 第一步：插入分组数据 ============
INSERT INTO ZRLDATABASE."GROUPS" (NAME) VALUES 
('开发组'), ('测试组'), ('设计组'), ('项目管理组'),
('运维组'), ('数据分析组'), ('产品组'), ('质量保证组');

-- ============ 第二步：插入项目数据 ============
INSERT INTO ZRLDATABASE.PROJECTS (NAME, DESCRIPTION, STATUS) VALUES
('ZRL数字化平台', '中石化ZRL项目数字化管理平台建设', 2),
('ERP系统升级', '企业资源计划系统升级项目', 2),
('安全防护体系', '网络安全防护体系建设', 1),
('移动办公平台', '企业移动办公应用开发', 2),
('数据仓库建设', '企业级数据仓库系统', 1);

-- ============ 第三步：插入项目成员数据 ============
-- 注意：需要先获取实际的项目ID和分组ID，这里使用子查询方式

-- 为ZRL数字化平台项目添加成员
INSERT INTO ZRLDATABASE.PROJECT_MEMBERS (PROJECT_ID, GROUP_ID, MEMBER_NAME, POSITION, MEMBER_STATUS)
SELECT 
    p.ID AS PROJECT_ID,
    g.ID AS GROUP_ID,
    '张三' AS MEMBER_NAME,
    '项目经理' AS POSITION,
    1 AS MEMBER_STATUS
FROM ZRLDATABASE.PROJECTS p, ZRLDATABASE."GROUPS" g
WHERE p.NAME = 'ZRL数字化平台' AND g.NAME = '项目管理组';

INSERT INTO ZRLDATABASE.PROJECT_MEMBERS (PROJECT_ID, GROUP_ID, MEMBER_NAME, POSITION, MEMBER_STATUS)
SELECT 
    p.ID AS PROJECT_ID,
    g.ID AS GROUP_ID,
    '李四' AS MEMBER_NAME,
    '后端开发工程师' AS POSITION,
    2 AS MEMBER_STATUS
FROM ZRLDATABASE.PROJECTS p, ZRLDATABASE."GROUPS" g
WHERE p.NAME = 'ZRL数字化平台' AND g.NAME = '开发组';

-- 为ERP系统升级项目添加成员
INSERT INTO ZRLDATABASE.PROJECT_MEMBERS (PROJECT_ID, GROUP_ID, MEMBER_NAME, POSITION, MEMBER_STATUS)
SELECT 
    p.ID AS PROJECT_ID,
    g.ID AS GROUP_ID,
    '王五' AS MEMBER_NAME,
    '测试工程师' AS POSITION,
    2 AS MEMBER_STATUS
FROM ZRLDATABASE.PROJECTS p, ZRLDATABASE."GROUPS" g
WHERE p.NAME = 'ERP系统升级' AND g.NAME = '测试组';

-- 为安全防护体系项目添加成员
INSERT INTO ZRLDATABASE.PROJECT_MEMBERS (PROJECT_ID, GROUP_ID, MEMBER_NAME, POSITION, MEMBER_STATUS)
SELECT 
    p.ID AS PROJECT_ID,
    g.ID AS GROUP_ID,
    '赵六' AS MEMBER_NAME,
    '安全工程师' AS POSITION,
    1 AS MEMBER_STATUS
FROM ZRLDATABASE.PROJECTS p, ZRLDATABASE."GROUPS" g
WHERE p.NAME = '安全防护体系' AND g.NAME = '开发组';

-- 提交事务
COMMIT;
create view jira_contribution as
select key as identifier,
       0 as subidentifier,
       "JIRA_CREATED" as type,
       created as date,
       reporter as author,
       reporter as owner
from jira_issue
UNION
select key identifier,
       id as subidentifier,
       "JIRA_COMMENTED" as type,
       created as date,
       author as author,
       owner as owner
from jira_comment

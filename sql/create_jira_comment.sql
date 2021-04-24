drop view jira_comment;
create view jira_comment as
select issue.key,
       json_extract(issue.value, "$.fields.reporter.key") as owner,
       json_extract(comment.value, "$.id") as id,
       json_extract(comment.value, "$.author.key") as author,
       substring(json_extract(comment.value, "$.created"),0,24) as created
from raw_jira_issue as issue,
     json_each(issue.value, "$.fields.comment.comments") as comment
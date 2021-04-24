drop view jira_issue;
create view jira_issue as
select key,
       json_extract(issue.value, "$.id")                                      as id,
       json_extract(issue.value, "$.fields.summary")                          as summary,
       json_extract(issue.value, "$.fields.creator.key")                      as creator,
       json_extract(issue.value, "$.fields.reporter.key")                     as reporter,
       json_extract(issue.value, "$.fields.assignee.key")                     as assignee,
       substring(json_extract(issue.value, "$.fields.created"), 0, 24)        as created,
       substring(json_extract(issue.value, "$.fields.updated"), 0, 24)        as updated,
       substring(json_extract(issue.value, "$.fields.resolutiondate"), 0, 24) as resolved,
       json_extract(issue.value, "$.fields.resolution.name")                  as resolution,
       json_extract(issue.value, "$.fields.status.name")                      as status,
       json_extract(issue.value, "$.fields.priority.name")                    as priority,
       json_extract(issue.value, "$.fields.watches.watchCount")               as watches,
       json_extract(issue.value, "$.fields.parent.key")                       as parent
from raw_jira_issue as issue
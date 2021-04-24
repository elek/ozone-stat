drop view github_run;
create view github_run as
select org,
       repo,
       id,
       json_extract(value, "$.name")        as name,
       json_extract(value, "$.status")      as status,
       json_extract(value, "$.conclusion")  as conclusion,
       json_extract(value, "$.workflow_id") as workflowid,
       json_extract(value, "$.created_at")  as createdat,
       json_extract(value, "$.updated_at")  as updatedat,
       json_extract(value, "$.event")       as event,
       json_extract(value, "$.head_branch") as branch
from raw_github_run
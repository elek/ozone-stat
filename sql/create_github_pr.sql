create view github_pr as
select org,
       repo,
       number,
       json_extract(value, "$.createdAt") as createdat,
       json_extract(value, "$.updatedAt") as updatedat,
       json_extract(value, "$.closedAt") as closedat,
       json_extract(value, "$.merged") as merged,
       json_extract(value, "$.closed") as closed,
       json_extract(value, "$.isDraft") as isdraft,
       json_extract(value, "$.author.login") as author,
       json_extract(value, "$.mergedBy.login") as mergedby,
       json_extract(value, "$.title") as title
from raw_github_pr;
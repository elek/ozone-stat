drop view github_contribution;
create view github_contribution as
select org,
       repo,
       number as identifier,
       "PR_CREATED" as type,
       0 as subidentifier,
       createdAt as date,
       author as author,
       author as owner
from github_pr
UNION
select org,
       repo,
       number as identifier,
       "PR_MERGED" as type,
       0 as subidentifier,
       closedat as date,
       mergedby as author,
       author as owner
from github_pr where merged = 1
UNION
select org,
       repo,
       number         as identifier,
       "PR_COMMENTED" as type,
       id             as subidentifier,
       createdat      as date,
       author,
       pr_author      as owner
from github_comment
UNION
select org,
       repo,
       number         as identifier,
       "PR_REVIEWED" as type,
       id             as subidentifier,
       createdat      as date,
       author,
       pr_author      as owner
from github_review
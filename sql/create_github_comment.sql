create view github_comment as
select raw_github_pr.org,
       raw_github_pr.repo,
       raw_github_pr.number,
       json_extract(comment.value, "$.databaseId")         as id,
       json_extract(raw_github_pr.value, "$.author.login") as pr_author,
       json_extract(comment.value, "$.author.login")       as author,
       json_extract(comment.value, "$.authorAssociation")  as authorrole,
       json_extract(comment.value, "$.createdAt")          as createdat
from raw_github_pr,
     json_each(raw_github_pr.value, "$.comments.nodes") as comment
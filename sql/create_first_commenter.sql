-- -- create view github_pr_firstcomment as
select * from (
select pr.author,first_comment.*, strftime("%s", first_comment.date) - strftime("%s", pr.createdat) as first_comment
from (select org, repo, identifier, date, author
      from github_contribution
      where type != "PR_CREATED"
        AND author != owner
        and author not in ('codecov-commenter', 'sonarcloud', 'github-actions')
      group by org, repo, identifier
      having min(date)) as first_comment
         left join github_pr as pr
                   on pr.org = first_comment.org AND pr.repo = first_comment.repo AND pr.number = first_comment.identifier
order by first_comment desc) where identifier = 2

--
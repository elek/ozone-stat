
select org, repo, id, strftime("%s", completed) - strftime("%s", started)
from github_job

select run.*, runtime.time
from github_run as run
         left join (select org, repo, runid, sum(strftime("%s", completed) - strftime("%s", started)) as time
                    from github_job
                    group by org, repo, runid) as runtime
                   ON run.org = runtime.org and run.repo = runtime.repo AND run.id = runtime.runid
where event = "push"
  and run.branch = "master"
  and run.repo = "ozone"
  and run.conclusion = "success"
order by createdat desc



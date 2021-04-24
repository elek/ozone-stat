create view github_job as
select jobs.org,
       jobs.repo,
       jobs.id as runid,
       json_extract(job.value,"$.id") as id,
       json_extract(job.value,"$.name") as name,
       json_extract(job.value,"$.started_at") as started,
       json_extract(job.value,"$.completed_at") as completed,
       json_extract(job.value,"$.status") as status,
       json_extract(job.value,"$.conclusion") as conclusion
       from raw_github_job as jobs, json_each(jobs.value, "$.jobs") as job
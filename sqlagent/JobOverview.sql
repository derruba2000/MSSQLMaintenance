

SELECT distinct j.[name],
MAX(CAST(
STUFF(STUFF(CAST(jh.run_date as varchar),7,0,'-'),5,0,'-') + ' ' + 
STUFF(STUFF(REPLACE(STR(jh.run_time,6,0),' ','0'),5,0,':'),3,0,':') as datetime)) AS [LastRun],
CASE jh.run_status WHEN 0 THEN 'Failed'
WHEN 1 THEN 'Success'
WHEN 2 THEN 'Retry'
WHEN 3 THEN 'Canceled'
WHEN 4 THEN 'In progress'
END AS Status
,jh.run_date as [Job last run date]
,jh.run_time as [job last run time]
--,j.enabled as [Job Enabled]
--,js.enabled as [Job schedule Enabled]
,js.next_run_date as [Job next run date]
,js.next_run_time as [job next run time]
FROM msdb.dbo.sysjobs j left outer join
sysjobhistory jh on j.job_id = jh.job_id
left outer join
sysjobschedules js on j.job_id =js.job_id
group by j.name--,j.enabled,js.enabled
,js.next_run_date
,js.next_run_time,jh.run_date,jh.run_time,jh.run_status
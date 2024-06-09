### Incident Report: HPC Resource Allocation Issue

The following is the incident report for the Simlab HPC Cluster infrastructure outage that occurred between June 3 and June 4, 2024. We understand this resource allocation issue has impacted our valued users, and we apologize to everyone who was affected.

#### Issue Summary

From 09:00 PM to 03:10 AM (GMT+1) The HPC cluster experienced significant job queuing delays. Approximately 89% of users were affected, facing extended wait times for their jobs to be executed. The root cause was a configuration bug permitted users to reserve more than the allowed CPUs by specifying more memory not CPUs, leading to CPU and memory resource depletion by a single long-running job.

#### Timeline

- **09:00 PM:** Issue detected via user complaints about excessive job queue times.
- **09:05 PM:** Monitoring alerts confirmed unusual CPU and memory allocation patterns.
- **09:10 PM:** Initial investigation focused on job scheduling algorithms and hardware performance metrics.
- **09:50 PM:** Assumptions made about potential hardware failure; hardware diagnostics commenced.
- **11:09 PM:** Misleading investigation into potential network latency issues.
- **11:43 PM:** Escalated to the HPC systems engineering team.
- **01:00 AM:** Detailed analysis of job logs and user configurations began.
- **02:34 AM:** Root cause identified as a configuration error allowing unlimited memory reservation per CPU.
- **02:51 AM:** Configuration adjusted to enforce memory limits per CPU, long-running job canceled.
- **03:00 AM:** Job scheduler and resource manager restarted with new settings.
- **03:08 AM:** Backup list of queued jobs applied.
- **03:14 AM:** Normal operations resumed; issue resolved.

#### Root Cause and Resolution

**Root Cause:** The configuration error allowed users to reserve an unlimited amount of memory. Each CPU could handle up to 8GB of memory, and users were not supposed to reserve more than 10 CPUs unless explicitly requested from the team. However, the unlimited memory reservation linked to CPU allocation allowed a single job to monopolize resources. Consequently, other users experienced significant delays as their jobs were queued behind this resource-intensive job.

**Resolution:** The issue was resolved by modifying the cluster configuration to enforce memory limits per CPU. Specifically, the memory reservation was capped at 8GB per CPU. The long-running job was canceled, and the job scheduler and resource manager were restarted to apply the new settings, restoring normal operation. The downtime for restarting was 14 minutes, after which the backup list of queued jobs was applied.

#### Corrective and Preventative Measures

**Improvements and Fixes:**

1. **Configuration Review:** Regularly review and update HPC cluster configurations to prevent similar issues.
2. **Monitoring Enhancements:** Implement more granular monitoring of CPU and memory usage per job.
3. **User Education:** Provide guidelines and training for users on efficient resource allocation.
4. **Policy Enforcement:** Enforce stricter resource allocation policies to prevent misuse.

**Task List:**

1. **Patch Job Scheduler:** Update job scheduler configurations to enforce memory limits per CPU.
2. **Implement Monitoring:** Deploy monitoring tools to track memory and CPU usage more effectively.
3. **Create Alerts:** Set up alerts for unusual resource usage patterns.
4. **User Documentation:** Develop and distribute documentation on best practices for resource allocation.
5. **Regular Audits:** Schedule regular audits of system configurations and user allocations.
6. **Feedback Loop:** Establish a feedback mechanism for users to report resource allocation issues promptly.

By addressing these tasks, we aim to prevent similar incidents in the future and ensure the efficient operation of our HPC resources.

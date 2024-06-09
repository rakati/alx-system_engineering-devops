### Incident Report: HPC Resource Allocation Issue

#### Issue Summary

**Duration:** June 1, 2024, 09:00 PM - June 4, 2024, 03:10 AM (GMT+1)

**Impact:** The HPC cluster experienced significant job queuing delays. Approximately 89% of users were affected, facing extended wait times for their jobs to be executed. The root cause was a misconfiguration allowing users to reserve unlimited memory, making the rule limiting the number of CPUs per user useless, leading to resource starvation.

**Root Cause:** A configuration bug permitted users to reserve more than the allowed CPUs by specifying more memory not CPUs, leading to CPU and memory resource depletion by a single long-running job.

#### Timeline

- **June 1, 2024, 09:00 PM:** Issue detected via user complaints about excessive job queue times.
- **June 1, 2024, 09:05 PM:** Monitoring alerts confirmed unusual CPU and memory allocation patterns.
- **June 1, 2024, 09:10 PM:** Initial investigation focused on job scheduling algorithms and hardware performance metrics.
- **June 1, 2024, 09:50 PM:** Assumptions made about potential hardware failure; hardware diagnostics commenced.
- **June 1, 2024, 11:09 PM:** Misleading investigation into potential network latency issues.
- **June 1, 2024, 11:43 PM:** Escalated to the HPC systems engineering team.
- **June 2, 2024, 01:00 AM:** Detailed analysis of job logs and user configurations began.
- **June 2, 2024, 02:34 AM:** Root cause identified as a configuration error allowing unlimited memory reservation per CPU.
- **June 3, 2024, 02:51 AM:** Configuration adjusted to enforce memory limits per CPU, long-running job canceled.
- **June 3, 2024, 03:00 AM:** Job scheduler and resource manager restarted with new settings.
- **June 3, 2024, 03:08 AM:** Backup list of queued jobs applied.
- **June 3, 2024, 03:14 AM:** Normal operations resumed; issue resolved.

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

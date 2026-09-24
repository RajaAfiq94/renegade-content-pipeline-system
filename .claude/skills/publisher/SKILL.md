---
name: publisher
description: Run Agent 4 Publisher for the Social Content Manager. Use when the run prompt says "Run as Agent 4" or "Publisher".
---

# Agent 4: Publisher

Connectors this run uses: Notion, Metricool, plus Slack or Gmail for step 5 only.

This agent is the only one that writes to the live Instagram schedule. Routines never pause for approval, so the Notion Status is the entire safeguard.

1. Follow the run protocol in CLAUDE.md.
2. From Notion (page 3e426834-623f-8163-bb77-f6b0adee7289), read 00 System Settings, 01 Standards and Rules, and the **Agent 4: Publisher** playbook. The playbook is the authority for every step.
3. Take the Metricool blogId and Instagram account from 00 System Settings. If either is TBC, log Partial with Needs Afiq ticked and stop. Never guess them.
4. Query the Content Calendar for rows with Status = **Post Approved**. No other status qualifies, whatever the publish date.
5. For each row, immediately before calling Metricool:
   - Re-fetch the row and confirm Status is still Post Approved.
   - Confirm it has a finished asset link and a caption.
   - If either check fails, skip the row and note it in the Run Log.
6. Before creating a post, check Metricool's scheduled posts for one already linked to this row. Never schedule the same row twice. Never delete a Metricool post.
7. After scheduling, write the Metricool post link to the row and set Status as the playbook specifies.
8. Write the Run Log row. Notify Afiq only if the run is Partial or Failed, or an approved row could not be scheduled.

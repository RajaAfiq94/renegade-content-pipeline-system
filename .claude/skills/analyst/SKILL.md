---
name: analyst
description: Run Agent 5 Analyst for the Social Content Manager. Use when the run prompt says "Run as Agent 5" or "Analyst".
---

# Agent 5: Analyst

Connectors this run uses: Notion, Metricool, plus Slack or Gmail for step 5 only.

1. Follow the run protocol in CLAUDE.md.
2. From Notion (page 3e426834-623f-8163-bb77-f6b0adee7289), read 00 System Settings, 01 Standards and Rules, and the **Agent 5: Analyst** playbook. The playbook is the authority for every step.
3. Pull last week's Instagram and competitor data from Metricool for the period the playbook defines. Save the raw numbers to files in the workspace and compute every figure in Python. Never estimate a number in prose.
4. Score posts with the scoring standard in 01 Standards and Rules and write the scores back to the Content Calendar or Content Library as the playbook specifies.
5. Create this week's row in Weekly Reports following the reporting standard.
6. The weekly report always goes to Afiq. Tick Needs Afiq and notify him with the three headline numbers, the top recommendation, and a link to the Weekly Reports row.
7. Write the Run Log row.

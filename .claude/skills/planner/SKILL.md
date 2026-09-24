---
name: planner
description: Run Agent 2 Planner for the Social Content Manager, in Calendar mode or Draft mode. Use when the run prompt says "Run as Agent 2" or "Planner".
---

# Agent 2: Planner

Connectors this run uses: Notion, plus Slack or Gmail for step 5 only.

1. Follow the run protocol in CLAUDE.md.
2. Read the mode from the run prompt: **Calendar** or **Draft**. If the prompt names neither, log Failed with a note and stop.
3. From Notion (page 3e426834-623f-8163-bb77-f6b0adee7289), read 00 System Settings, 01 Standards and Rules, and the **Agent 2: Planner** playbook, including the section for this mode. The playbook is the authority for every step.
4. Use `product-snapshot.md` in this repo for which offers content may point to. Content never states prices and never pitches The First 30 or retainers.

## Calendar mode (22nd of each month)

- Build next month's rows in the Content Calendar with Status = Calendar Review, using the latest Competitors data and Weekly Reports as the playbook directs.
- Do not touch rows for the current month.
- When the rows are in, tick Needs Afiq and notify him: how many posts, the pillar mix, and a link to the Content Calendar view. He approves by the 28th.

## Draft mode (daily)

- Work only on rows with Status = Calendar Approved, or rows returned as Rejected with Feedback, as the playbook directs.
- Re-read each row's Status immediately before writing to it.
- Apply the Feedback on rejected rows before anything else.
- Notify Afiq only if the run is Partial or Failed, or a row needs his decision.

5. Write the Run Log row and notify Afiq if needed.

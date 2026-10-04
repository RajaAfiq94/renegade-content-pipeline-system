---
name: producer
description: Run Agent 3 Producer for the Social Content Manager. Use when the run prompt says "Run as Agent 3" or "Producer".
---

# Agent 3: Producer

Connectors this run uses: Notion, plus Slack or Gmail for step 5 only. Google Drive and Canva are not used for finished posts.

1. Follow the run protocol in CLAUDE.md.
2. From Notion (page 3e426834-623f-8163-bb77-f6b0adee7289), read 00 System Settings, 01 Standards and Rules, and the **Agent 3: Producer** playbook. The playbook is the authority for every step.
3. Brand comes from the Momentum Inc. Design System named in the playbook. The Drive folders and Canva brand kit in 00 System Settings are not needed for Carousel and Single Image rows, so a TBC there does not stop the run.
4. Work only on the rows the playbook assigns to the Producer. Re-read each row's Status immediately before producing it.
5. All content is faceless. Use only footage from the Screen Recording Bank and the brand kit. Never state prices.
6. Deliver finished PNGs to Afiq in the session instead of uploading them to Drive:
   - Export into the scratchpad directory, one folder per row, named `<publish-date>-<short-title>/slide-01.png ...` (a Single Image is `post.png`). Do not write them inside the repo.
   - Send every PNG with SendUserFile (status proactive, display attach), in slide order, with a caption holding the row title and publish date. Send at most one row per call.
   - On the Content Calendar row, put the folder name and slide count in Asset Links (for example `Sent to Afiq in session 2026-10-04: 2026-10-05-five-agents, 7 PNGs, 1080x1350`) and set Status = Post Review.
   - If SendUserFile fails for a row, set Status = Blocked, explain in Feedback and tick Needs Afiq. Do not retry more than once.
7. Never delete a Library item or any Drive file. Retire by changing Status.
8. When any row reaches Post Review, tick Needs Afiq and notify him with a link to each row. The PNGs are already in the session from step 6.
9. Write the Run Log row and notify Afiq if needed.

# Renegade Social Content Manager

Instructions for the five agents that run the Renegade Plus Instagram page as Claude Code routines. Notion page **Social Content Manager** holds the playbooks, settings and data. This repo tells each routine where to find them and how to report back.

```
CLAUDE.md                 Project instructions: run protocol, gates, hard rules
product-snapshot.md       Entry offers, content-safe (no prices)
.claude/skills/
  market-intel/           Agent 1
  planner/                Agent 2 (Calendar and Draft modes)
  producer/               Agent 3
  publisher/              Agent 4
  analyst/                Agent 5
```

## Before the first run

1. Push this repo to a **private** GitHub repo and connect GitHub to Claude Code (claude.ai/code, or `/web-setup` in the CLI).
2. Make sure these connectors are on your claude.ai account: Notion, Metricool, Apify, Canva, Google Drive, and Slack (Gmail as fallback).
3. In Notion **00 System Settings**, add a row **Afiq Slack User ID** with your Slack member ID (Slack profile, three dots, Copy member ID). Until it is filled, notifications go to afiq@renegadeplus.com via Gmail.
4. Fill every other TBC in 00 System Settings.
5. Turn off the six scheduled tasks in the claude.ai Project once the routines pass their test runs, so nothing runs twice.

## Create the routines

Create each one at claude.ai/code/routines, or with `/schedule` in the CLI. For each routine: select this repo, the Default environment, the model you want, and trim connectors to the list shown.

| Routine | Schedule (MYT) | Cron (UTC) | Prompt | Connectors |
|---|---|---|---|---|
| Market Intel | 20th monthly, 09:00 | `0 1 20 * *` | Run as Agent 1: Market Intel. Follow the playbook in Notion. | Notion, Apify, Metricool, Slack, Gmail |
| Planner: Calendar | 22nd monthly, 09:00 | `0 1 22 * *` | Run as Agent 2: Planner in Calendar mode. Follow the playbook in Notion. | Notion, Slack, Gmail |
| Planner: Drafts | Daily, 10:00 | `0 2 * * *` | Run as Agent 2: Planner in Draft mode. Follow the playbook in Notion. | Notion, Slack, Gmail |
| Producer | Daily, 11:00 | `0 3 * * *` | Run as Agent 3: Producer. Follow the playbook in Notion. | Notion, Canva, Google Drive, Slack, Gmail |
| Publisher | Daily, 17:00 | `0 9 * * *` | Run as Agent 4: Publisher. Follow the playbook in Notion. | Notion, Metricool, Slack, Gmail |
| Analyst | Monday, 08:00 | `0 0 * * 1` | Run as Agent 5: Analyst. Follow the playbook in Notion. | Notion, Metricool, Slack, Gmail |

The monthly routines need a custom cron. Pick the closest preset in the form, then run `/schedule update` in the CLI and give it the cron from the table.

Remove HubSpot, Apollo, Vibe Prospecting, Higgsfield and Google Calendar from every routine. A routine can use every tool of every connector it includes, writes included, without asking.

## Test

1. Click **Run now** on Market Intel, then on Planner: Calendar.
2. Open each run and read the transcript. A green status only means the session didn't crash.
3. Check the Run Log row in Notion and that the Slack DM or email arrived.
4. Run Producer and Publisher once each against a test row before turning the schedules on.

## Changing things

- Change what an agent does: edit its playbook in Notion. No repo change needed.
- Change a rule, pillar or setting: edit 01 Standards and Rules or 00 System Settings in Notion.
- Change how routines report, which connectors they use, or the run protocol: edit this repo and push. The next run picks it up.

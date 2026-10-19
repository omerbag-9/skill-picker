---
name: skill-router
description: ALWAYS load this on the FIRST task of every session or conversation, before doing any work — it routes tasks to the user's installed skills so they never have to name one. Covers coding, documents, spreadsheets, slides, PDFs, research, charts, config, reviews and any domain-specific skills the user has. Load it only once per session, then keep applying its routing to every later task without loading it again.
---

# Skill Router

The user should never have to tell you which skill to use. You pick them, load them, and then do the task.

## Procedure

1. **Read the task.** Note the domain (web, data, docs, a framework...), the deliverable (a file type? a PR? a page?), and the tools involved.
2. **Scan the available-skills list in your context.** That listing is the source of truth: it includes account-synced skills, plugin skills, `~/.claude/skills`, and the project's `.claude/skills`. Use the hints table below to speed up matching, but never invoke a name that is not in the listing.
3. **Pick every skill that fits.** Prefer the most specific one. A task can need more than one (e.g. "build a report from this CSV as a Word file" → a spreadsheet skill + a Word skill). When two descriptions conflict, follow the rules written in their descriptions.
4. **Invoke them with the Skill tool before starting the work.** Load broad "router" or "triage" skills first, then the specific skills they point to. Use the exact name from the listing, including any prefix (e.g. `anthropic-skills:pdf`).
5. **Say it in one line**: `Using skills: X, Y`. If nothing matched, say nothing and proceed normally — never force a fit.
6. **Do the task** following the loaded skills' instructions.

## Rules

- **Load this skill once per session.** After that, keep applying the procedure yourself on every new task for the rest of the session — don't invoke `skill-router` again.
- Don't re-invoke a skill already loaded in this conversation (unless the context was compacted and its instructions are gone).
- If the user names a skill themselves, use theirs and skip routing.
- If the task changes topic mid-conversation, route again for the new topic.

## Routing hints

Only use a hint if a matching skill actually appears in the available-skills list.

| Task looks like | Look for a skill named like |
|---|---|
| Word document (.docx) | `docx` |
| PDF read / fill / merge / create | `pdf` |
| PowerPoint / slide deck (.pptx) | `pptx` |
| Excel / CSV / spreadsheet | `xlsx` |
| Charts, dashboards, data viz | `dataviz`, `chart` |
| Multi-source research report | `deep-research`, `research` |
| Create or improve a skill | `skill-creator` |
| Hooks, settings, permissions | `update-config` |
| Recurring or scheduled task | `schedule`, `loop` |
| Code review / security / cleanup | `code-review`, `security-review`, `simplify` |
| Run an app to check a change | `run`, `run-<project>` |
| A framework or platform (WordPress, React, Django...) | a `<framework>-router` skill first, then `<framework>-*` |
| Front-end / UI design | `frontend-design`, a design-system skill |

Domain skills the user installed (company playbooks, house styles, framework packs) usually describe exactly when to use them; trust their descriptions over this table.

# skill-router

**Stop telling Claude which skill to use.** `skill-router` makes Claude look at the skills you already have installed, pick the ones that fit your task, and load them automatically.

```
You:    turn this CSV into a Word report with a chart
Claude: Using skills: xlsx, dataviz, docx
        ...
```

## Why

Claude chooses skills by reading their descriptions, and it often skips them unless you name them in your prompt. `skill-router` adds one routing step at the start of each session, so your skills actually get used.

## Low token cost

It **doesn't** run on every prompt:

- A `SessionStart` hook adds one short instruction (~80 tokens) when a session starts.
- On your first real task, Claude loads the router once (~900 tokens).
- For the rest of the session, Claude applies the routing itself without reloading it.

The hook fires again after `/clear` or when a long conversation gets compacted, because the router's rules can drop out of context then.

## Install

### Option A: Claude Code plugin (recommended, includes the hook)

Inside Claude Code:

```
/plugin marketplace add omerbag-9/skill-router
/plugin install skill-router@skill-router
```

Start a new session and you're done.

### Option B: Account-wide skill on claude.ai (syncs to every device)

1. Download `skill-router.zip` from the [latest release](https://github.com/omerbag-9/skill-router/releases/latest).
2. On claude.ai go to **Settings → Capabilities → Skills → Upload skill** and turn it on.

This syncs to every device signed into your account, and it also works in claude.ai chat. You don't get the hook this way, so the skill relies on its description to load itself on the first task. That works most of the time but isn't guaranteed. Use Option A as well in Claude Code if you want it reliable.

### Option C: Manual

```bash
git clone https://github.com/omerbag-9/skill-router.git
mkdir -p ~/.claude/skills
cp -r skill-router/skills/skill-router ~/.claude/skills/
```

## Customize

Edit the **Routing hints** table in `skills/skill-router/SKILL.md` to map your own tasks to your own skills, e.g. `| Our API conventions | acme-api-style |`.

## Uninstall

```
/plugin uninstall skill-router@skill-router
```

## License

MIT

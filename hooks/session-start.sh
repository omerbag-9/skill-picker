#!/bin/bash
# SessionStart: tell Claude once per session to load the skill-router skill on the first task.
printf '%s\n' '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"[skill-router] On the first real task in this session (not small talk), invoke the skill-router skill with the Skill tool before doing anything else, then load the skills it points to. Invoke it only once per session: for every later task, apply its routing yourself (scan the available-skills list, load the matching skills, say \"Using skills: ...\"). The user should never have to name a skill."}}'

---
description: Memory protocol governing how engram and basic-memory are used across all sessions.
mode: all
---

## Memory Protocol

### Engram — automatic AI working memory

Engram is my long-term memory. I manage it automatically without prompting.

**Save to engram after any of the following:**
- Architectural or design decisions
- Bug fixes (what was wrong, why, how it was fixed)
- Configuration changes or environment setup
- Patterns or conventions established
- Non-obvious discoveries or gotchas
- **Pivots**: any time an initial approach didn't work and we changed course — format as "Tried X → didn't work because Y → do Z instead"
- **Directives**: any time the user asks me to do something differently than I would by default — save the rule so it persists across sessions
- Workarounds for things that don't work as documented

**At session start:**
- Call `mem_context` to load recent session history
- Search engram before starting work on anything that might have prior history
- If the user's first message references a project, feature, or problem — search engram for it before responding

**Scope discipline:**
- Engram observations scoped to the relevant project or codebase
- When saving basic-memory or vault-related rules, explicitly tag them as such (e.g. "for vault notes via basic-memory") — do not save them as universal rules that could bleed into unrelated sessions

---

### Basic-memory — human-owned vault notes

Basic-memory reads and writes markdown files in the user's vault (`~/notes` → `~/Documents/LiquidVault`). The vault is human-first — notes must remain readable and useful without any AI tooling.

**Only write to the vault when explicitly asked by the user.**

**When writing vault notes:**
- Use standard markdown only
- Use `[[wikilinks]]` for internal links — never `memory://` URIs or `[foo](foo.md)` style markdown links
- Standard YAML frontmatter only — no basic-memory-specific fields unless the user asks for them
- Session summaries go in `sessions/` at the vault root
- Follow any link style or structure preferences the user has stated

**When reading from the vault:**
- Load notes for context when the user asks ("load my notes on X")
- Use `search_notes` or `build_context` to find relevant notes when the user asks to rebuild context for a project

**Basic-memory does not replace engram.** They serve different purposes:
- Engram = AI working memory, automatic, internal
- Basic-memory = user's second brain, explicit, human-readable

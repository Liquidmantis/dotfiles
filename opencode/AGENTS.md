## About me

- I'm an experienced developer (builder level). Skip the basics and be direct.
- I primarily work in Python and Go. Prefer these languages for examples and snippets.
- I'm very comfortable in the terminal, so no shell hand-holding needed.

## Communication

- Be concise but include relevant detail. I like understanding the "why" and edge cases.
- Explain the concept or rationale first, then show the practical application.
- Avoid filler words like "comprehensive", "utilize", "streamline", or "leverage".

## Working with Git

- Always use semantic commit prefixes (feat:, fix:, docs:, refactor:, chore:, etc.).
- Never push to the main branch. Always push to a feature branch.
- Run the project's lint and test scripts before committing, if they exist.

## Code style

- Match the existing conventions of whatever project I'm in.
- For Python, prefer type hints and follow PEP 8.
- For Go, keep it idiomatic: handle errors explicitly, keep functions small.

## MCP authentication

- When troubleshooting MCP connection issues, first read my OpenCode config
  (~/.config/opencode/opencode.jsonc) to find the actual remote MCP server names,
  then give me the exact commands to run using those real names.
- Always substitute the real server name. For example, say `opencode mcp auth sentry`,
  not `opencode mcp auth <server-name>`.
- Related commands:
  - `opencode mcp auth <name>` — authenticate (or re-authenticate) a server
  - `opencode mcp auth list` — list servers and their auth status
  - `opencode mcp logout <name>` — clear stored credentials for a server
  - `opencode mcp debug <name>` — inspect connection details for troubleshooting

# PaperJSX Agent Skill

Generate PPTX presentations, DOCX documents, XLSX spreadsheets, and PDF reports from structured JSON using the free-tier `@paperjsx/*` packages. Runs locally — no API key, no network calls.

This repo distributes the PaperJSX skill to multiple AI agent platforms.

---

## Claude Code

```bash
/plugin marketplace add paperjsx/agent-skill
/plugin install paperjsx@paperjsx-agent-skill
```

Then: *"Use PaperJSX to create a 3-slide presentation about Q4 results."*

## Claude.ai (Pro / Team / Enterprise)

1. Zip the skill folder: `zip -r paperjsx-skill.zip skills/paperjsx/`
2. Go to **claude.ai → Settings → Customize → Skills → +**
3. Upload `paperjsx-skill.zip`, toggle on.

## Codex CLI (OpenAI)

```bash
$skill-installer install https://github.com/paperjsx/agent-skill
```

Or manual:
```bash
cp -r skills/paperjsx ~/.codex/skills/paperjsx
```

## Gemini CLI

Install via the [paperjsx/gemini-extension](https://github.com/paperjsx/gemini-extension) repo, or add to `~/.gemini/settings.json`:

```json
{
  "mcpServers": {
    "paperjsx": {
      "command": "npx",
      "args": ["@paperjsx/mcp-server"]
    }
  }
}
```

## MCP Server Config Snippets

All of these use the `@paperjsx/mcp-server` package (free, local, no API key).

### Claude Desktop

`~/Library/Application Support/Claude/claude_desktop_config.json` (macOS) /
`%APPDATA%\Claude\claude_desktop_config.json` (Windows)

```json
{
  "mcpServers": {
    "paperjsx": {
      "command": "npx",
      "args": ["@paperjsx/mcp-server"]
    }
  }
}
```

### Cursor

`.cursor/mcp.json`

```json
{
  "mcpServers": {
    "paperjsx": {
      "command": "npx",
      "args": ["@paperjsx/mcp-server"]
    }
  }
}
```

### VS Code (GitHub Copilot)

`.vscode/mcp.json`

```json
{
  "servers": {
    "paperjsx": {
      "command": "npx",
      "args": ["@paperjsx/mcp-server"]
    }
  }
}
```

### Windsurf

`~/.windsurf/mcp.json` (same format as Cursor)

### Cline

VS Code settings → Cline MCP Servers → Add server with command `npx @paperjsx/mcp-server`.

---

## What's in this repo

| Path | Purpose |
|---|---|
| `.claude-plugin/plugin.json` | Claude Code plugin manifest |
| `skills/paperjsx/SKILL.md` | Skill definition for Claude and Codex |
| `skills/paperjsx/references/json-schema.md` | JSON schema reference for document formats |
| `agents/openai.yaml` | OpenAI-compatible agent spec |

## License

Apache-2.0 — see [LICENSE](./LICENSE).

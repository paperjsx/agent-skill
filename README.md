# PaperJSX Agent Skill

Generate PPTX presentations, DOCX documents, XLSX spreadsheets, and PDF reports from validated JSON using the free-tier `@paperjsx/*` packages. Runs locally through `@paperjsx/mcp-server` with no API key and no hosted backend.

This bundle is generated from the source-of-truth agent files in the PaperJSX monorepo so GitHub, Claude, and Codex distribution stay in sync.

## Install

### Claude Code

```bash
/plugin marketplace add paperjsx/agent-skill
/plugin install paperjsx@paperjsx-agent-skill
```

### Claude.ai

Upload the generated `paperjsx-skill.zip` bundle from this repo's release artifacts, or rebuild it locally with:

```bash
./scripts/generate.sh
```

Then go to **claude.ai → Settings → Customize → Skills → +** and upload the ZIP.

### Codex CLI

```bash
$skill-installer install https://github.com/paperjsx/agent-skill
```

Or copy the skill manually:

```bash
cp -r skills/paperjsx ~/.codex/skills/paperjsx
```

## MCP Setup

### Claude Desktop

```json
{
  "mcpServers": {
    "paperjsx": {
      "command": "npx",
      "args": ["-y", "@paperjsx/mcp-server"]
    }
  }
}
```

### Cursor

```json
{
  "mcpServers": {
    "paperjsx": {
      "command": "npx",
      "args": ["-y", "@paperjsx/mcp-server"]
    }
  }
}
```

### VS Code Copilot

```json
{
  "servers": {
    "paperjsx": {
      "command": "npx",
      "args": ["-y", "@paperjsx/mcp-server"]
    }
  }
}
```

### Gemini CLI

```json
{
  "mcpServers": {
    "paperjsx": {
      "command": "npx",
      "args": ["-y", "@paperjsx/mcp-server"]
    }
  }
}
```

## Repo Layout

| Path | Purpose |
| --- | --- |
| `.claude-plugin/plugin.json` | Claude skill/plugin manifest |
| `.claude-plugin/marketplace.json` | Claude marketplace metadata |
| `skills/paperjsx/SKILL.md` | Main skill definition |
| `skills/paperjsx/references/` | Generated schema and example references |
| `agents/openai.yaml` | Codex/OpenAI metadata |
| `scripts/generate.sh` | Rebuilds the Claude upload ZIP from repo contents |

## Release Source

- Skill source: `packages/mcp-server/SKILL.md`
- References: `packages/mcp-server/references/*.md`
- OpenAI metadata: `packages/mcp-server/agents/openai.yaml`
- Skill version: `1.0.0`
- MCP server version: `0.3.1`

## License

Apache-2.0. See [LICENSE](./LICENSE).

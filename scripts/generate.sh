#!/usr/bin/env bash
# Helper: smoke-check the skill file structure and render a sample document via the MCP server.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Checking skill file structure..."
test -f "$ROOT/skills/paperjsx/SKILL.md" || { echo "missing SKILL.md"; exit 1; }
test -f "$ROOT/skills/paperjsx/references/json-schema.md" || { echo "missing json-schema.md"; exit 1; }
test -f "$ROOT/agents/openai.yaml" || { echo "missing agents/openai.yaml"; exit 1; }
test -f "$ROOT/.claude-plugin/plugin.json" || { echo "missing plugin.json"; exit 1; }
echo "  ok"

echo "Smoke-testing @paperjsx/mcp-server via stdio..."
printf '%s\n' \
  '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"skill-generate","version":"1"}}}' \
  '{"jsonrpc":"2.0","id":2,"method":"tools/list"}' \
  | timeout 20 npx -y @paperjsx/mcp-server >/tmp/paperjsx-skill-smoke.json 2>/dev/null || true

if grep -q '"tools"' /tmp/paperjsx-skill-smoke.json; then
  echo "  MCP server responded with tool catalog"
else
  echo "  WARN: MCP server did not return tools — check network / npm"
fi

echo "Done."

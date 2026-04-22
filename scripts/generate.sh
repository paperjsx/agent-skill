#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIST_DIR="$ROOT/dist"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Checking generated skill files..."
test -f "$ROOT/.claude-plugin/plugin.json"
test -f "$ROOT/.claude-plugin/marketplace.json"
test -f "$ROOT/agents/openai.yaml"
test -f "$ROOT/skills/paperjsx/SKILL.md"
test -f "$ROOT/skills/paperjsx/references/json-schema.md"
test -f "$ROOT/skills/paperjsx/references/examples.md"
test -f "$ROOT/skills/paperjsx/references/relaxed-input.md"
echo "  ok"

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR" "$TMP_DIR/paperjsx"
cp "$ROOT/skills/paperjsx/SKILL.md" "$TMP_DIR/paperjsx/SKILL.md"
cp -R "$ROOT/skills/paperjsx/references" "$TMP_DIR/paperjsx/references"

(cd "$TMP_DIR" && zip -qr "$DIST_DIR/paperjsx-skill.zip" paperjsx)

echo "Wrote $DIST_DIR/paperjsx-skill.zip"

---
name: paperjsx
description: Generate PPTX, DOCX, XLSX, and PDF deliverables from validated JSON. Runs in two modes — via the PaperJSX MCP server when its tools are connected, or by installing the free-tier @paperjsx/json-to-* npm packages and calling their programmatic API directly.
---

# PaperJSX Document Generation

Use this skill when the user wants a new presentation, report, invoice, contract, spreadsheet, or chart document generated from structured JSON.

PaperJSX is generation-only. It creates new artifacts; it does not edit existing Office or PDF files in place.

## Triggers

Use this skill when the user asks to:
- Generate a presentation, slide deck, or PowerPoint
- Create a PDF report, invoice, or chart document
- Create a DOCX report, contract, or invoice
- Generate an Excel workbook or spreadsheet
- Produce a document from structured JSON instead of hand-written layout code

## Runtime modes

Before doing anything else, detect which mode you're in:

**Mode A — MCP server is connected.** The tools `generate_presentation`, `generate_report`, `generate_invoice`, `generate_chart_document`, `generate_report_docx`, `generate_contract_docx`, `generate_invoice_docx`, and `generate_spreadsheet` are available. Call them directly with validated JSON. They save the artifact and return a path.

**Mode B — MCP server is NOT connected** (e.g. Claude.ai consumer, ChatGPT, Cursor without MCP, local sandbox). Install the matching `@paperjsx/json-to-*` npm package in the sandbox, build a JSON spec, and call its programmatic API. Save the returned Buffer to a file the user can download.

If the PaperJSX tools are not visible in the tool catalog, assume Mode B — do not ask the user to "connect" anything.

## Mode B quickstart (Claude.ai / ChatGPT / local sandbox)

| Output | Package | API |
|---|---|---|
| `.pptx` | `@paperjsx/json-to-pptx` | `PptxEngine.render(agentDocument)` → `Buffer` |
| `.docx` | `@paperjsx/json-to-docx` | `DocxEngine.render(document)` → `Buffer` |
| `.xlsx` | `@paperjsx/json-to-xlsx` | `SpreadsheetEngine.render(document)` → `Buffer` |
| `.pdf` | `@paperjsx/json-to-pdf` | `PdfEngine.render(document)` → `Buffer` |

Minimal Mode B flow (use whichever runtime the sandbox provides — Node, Python calling a Node subprocess, etc.):

```js
// npm install @paperjsx/json-to-pptx
import { PptxEngine, compileAgentDocument } from "@paperjsx/json-to-pptx";
import fs from "node:fs/promises";

const doc = {
  title: "Q4 Results",
  slides: [
    { pattern: "title", title: "Q4 2025", subtitle: "Results summary" },
    { pattern: "bullets", heading: "Revenue", bullets: ["$12M recurring", "+28% YoY"] },
  ],
};

const compiled = await compileAgentDocument(doc);
const buffer = await PptxEngine.render(compiled);
await fs.writeFile("q4-results.pptx", buffer);
```

For DOCX / XLSX / PDF, import the corresponding package and follow the same pattern. See [references/examples.md](./references/examples.md) for verified payloads in each format.

## Working rules

1. Pick the matching output format first, then pick the mode (A or B).
2. Build JSON that matches [references/json-schema.md](./references/json-schema.md) exactly.
3. Do not invent fields, aliases, or legacy shapes.
4. Prefer the verified payloads in [references/examples.md](./references/examples.md) before improvising a new shape.
5. In Mode B, surface the saved file path (or artifact) to the user so they can download it.
6. Never ask the user to "connect the MCP server" — just fall back to Mode B.

## Canonical references (bundled with this skill)

- [references/json-schema.md](./references/json-schema.md) — full JSON schema for every tool and format
- [references/examples.md](./references/examples.md) — verified JSON payloads that round-trip through the engine
- [references/relaxed-input.md](./references/relaxed-input.md) — legacy input coercions accepted under `relaxed: true`

All three are generated from source and validated by the package's `docs:verify` and `docs:render` tests.

## Output expectations

- Return the generated artifact path (or Buffer-backed download link) and any quality summary the engine provides.
- If validation fails, surface the real error. Do not guess at alternate field names.
- If the requested shape is close to a verified example, start from that example and adapt it minimally.

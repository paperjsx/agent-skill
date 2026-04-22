---
name: paperjsx
description: Generate PPTX, DOCX, XLSX, and PDF deliverables from validated JSON. Runs in two modes: via the PaperJSX MCP server when its tools are connected, or by installing the free-tier @paperjsx/json-to-* npm packages and calling them directly.
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

**Mode B — MCP server is not connected.** Install the matching `@paperjsx/json-to-*` package, build a JSON spec, render the output, and save it as a file the user can download.

If the PaperJSX tools are not visible in the tool catalog, assume Mode B and continue without asking the user to connect anything.

## Mode B quickstart

| Output | Package | API |
| --- | --- | --- |
| `.pptx` | `@paperjsx/json-to-pptx` | `PptxEngine.render(agentDocument)` |
| `.docx` | `@paperjsx/json-to-docx` | `DocxEngine.render(document)` |
| `.xlsx` | `@paperjsx/json-to-xlsx` | `SpreadsheetEngine.render(document)` |
| `.pdf` | `@paperjsx/json-to-pdf` | `PdfEngine.render(document)` |

Minimal Mode B flow:

```js
import { PptxEngine, compileAgentDocument } from "@paperjsx/json-to-pptx";
import fs from "node:fs/promises";

const document = {
  title: "Q4 Results",
  slides: [
    { pattern: "title", title: "Q4 2025", subtitle: "Results summary" },
    { pattern: "bullets", heading: "Revenue", bullets: ["$12M recurring", "+28% YoY"] },
  ],
};

const compiled = await compileAgentDocument(document);
const buffer = await PptxEngine.render(compiled);
await fs.writeFile("q4-results.pptx", buffer);
```

For DOCX, XLSX, and PDF, import the corresponding package and follow the same render-to-file pattern.

## Working rules

1. Pick the matching output format first, then pick the runtime mode.
2. Build JSON that matches [references/json-schema.md](./references/json-schema.md) exactly.
3. Do not invent fields, aliases, or legacy shapes.
4. Prefer the verified payloads in [references/examples.md](./references/examples.md) before improvising a new shape.
5. If validation fails, fix the exact field paths named in the error instead of guessing at alternate field names.
6. Return the saved artifact path to the user after generation.

## Canonical references

- [references/json-schema.md](./references/json-schema.md) — full JSON schema for every tool and format
- [references/examples.md](./references/examples.md) — verified JSON payloads that round-trip through the engines
- [references/relaxed-input.md](./references/relaxed-input.md) — accepted legacy coercions under `relaxed: true`

All three are generated from source and checked by the package release pipeline.

## Output expectations

- Return the generated artifact path and any quality summary the engine or MCP tool provides.
- If validation fails, surface the real error instead of guessing at alternate field names.
- If the request is close to a verified example, start from that example and adapt it minimally.

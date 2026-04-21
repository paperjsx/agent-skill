---
name: paperjsx
description: Generate PPTX, DOCX, XLSX, and PDF deliverables through the PaperJSX MCP tools using validated JSON input.
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

## Working rules

1. Pick the PaperJSX MCP tool that matches the requested output.
2. Build JSON that matches the generated schema reference exactly.
3. Do not invent fields, aliases, or legacy shapes.
4. Prefer the verified examples before improvising a new shape.
5. If you need to show the user the accepted surface, quote the generated reference instead of hand-writing field tables.

## Canonical references

- Schema reference: [references/json-schema.md](/Users/jake/plain/plainworks/paperjsx.com/packages/mcp-server/references/json-schema.md)
- Verified examples: [references/examples.md](/Users/jake/plain/plainworks/paperjsx.com/packages/mcp-server/references/examples.md)
- Relaxed coercions: [references/relaxed-input.md](/Users/jake/plain/plainworks/paperjsx.com/packages/mcp-server/references/relaxed-input.md)

All three files are generated from source-of-truth code and checked by `docs:verify` and `docs:render`.

## Tool routing

- `generate_presentation`: PPTX decks
- `generate_report`: PDF reports from markdown content
- `generate_invoice`: PDF invoices
- `generate_chart_document`: PDF chart documents
- `generate_report_docx`: DOCX reports
- `generate_contract_docx`: DOCX contracts
- `generate_invoice_docx`: DOCX invoices
- `generate_spreadsheet`: XLSX workbooks

## Output expectations

- Return the generated artifact path and any quality summary the tool provides.
- If validation fails, surface the real error instead of guessing at alternate field names.
- If the requested shape is close to a verified example, start from that example and adapt it minimally.

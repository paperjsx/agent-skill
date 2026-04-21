# PaperJSX Relaxed Input Coercions

This file is generated from the package-level relaxed-input preprocessors. It is the canonical list of opt-in legacy coercions exposed by `relaxed: true` entry points.

## @paperjsx/json-to-pptx

| Code | Path | Description | Legacy Shape | Modern Shape |
| --- | --- | --- | --- | --- |
| `PPTX_RELAXED_DOCUMENT_TYPE` | `type` | Coerces legacy top-level `type: "Document"` into the hosted agent contract discriminator. | { "type": "Document" } | { "type": "presentation" } |
| `PPTX_RELAXED_META_TITLE` | `meta.title` | Promotes legacy `meta.title` into `presentationTitle` when the modern field is missing. | { "meta": { "title": "Board Update" } } | { "presentationTitle": "Board Update" } |
| `PPTX_RELAXED_PATTERN_NAME` | `slides[].pattern` | Rewrites legacy camelCase and old pattern names to the supported pattern set. | `"chartFocus"` / `"chart"` / `"content"` | `"chart-focus"` / `"chart-focus"` / `"statement"` |
| `PPTX_RELAXED_SLIDE_CONTENT` | `slides[]` | Wraps legacy flat slide fields under `slide.content`. | { "pattern": "dashboard", "title": "...", "kpis": [...] } | { "pattern": "dashboard", "content": { "title": "...", "kpis": [...] } } |
| `PPTX_RELAXED_KPI_DELTA` | `slides[].content.kpis[].delta` | Maps legacy KPI `delta` into the supported `sublabel` field. | { "delta": "+18%" } | { "sublabel": "+18%" } |
| `PPTX_RELAXED_CHART_POINTS` | `slides[].content.chart` | Converts legacy `categories[]` + `series[].values[]` into `series[].dataPoints[]`. | { "categories": ["Q1"], "series": [{ "values": [42] }] } | { "series": [{ "dataPoints": [{ "category": "Q1", "value": 42 }] }] } |
| `PPTX_RELAXED_CHART_TYPE` | `slides[].content.chart.type` | Downgrades unsupported legacy agent chart families to the closest supported editable family with a warning. | `"scatter"` / `"waterfall"` / `"funnel"` | `"line"` / `"bar"` / `"bar"` |
## @paperjsx/json-to-docx

| Code | Path | Description | Legacy Shape | Modern Shape |
| --- | --- | --- | --- | --- |
| `DOCX_RELAXED_THEME_STRING` | `theme` | Wraps legacy string themes in the modern `{ preset }` object shape. | { "theme": "corporate" } | { "theme": { "preset": "corporate" } } |
| `DOCX_RELAXED_CODE_BLOCK` | `pages[].elements[].value` | Moves legacy code-block `value` into the supported `code` field. | { "type": "code-block", "value": "const x = 1;" } | { "type": "code-block", "code": "const x = 1;" } |
| `DOCX_RELAXED_MARGIN_TWIPS` | `margins` | Treats unusually large margin numbers as twips and converts them to points. | { "margins": { "top": 1440 } } | { "margins": { "top": 72 } } |
| `DOCX_RELAXED_PAGE_NUMBERS` | `footer.pageNumbers` | Maps legacy `pageNumbers` booleans onto `includePageNumber`. | { "footer": { "pageNumbers": true } } | { "footer": { "includePageNumber": true } } |
| `DOCX_RELAXED_META_KEY` | `meta` | Promotes legacy top-level `meta` into `metadata`. | { "meta": { "title": "Report" } } | { "metadata": { "title": "Report" } } |
| `DOCX_RELAXED_CHART_POINTS` | `pages[].elements[].series[].dataPoints` | Converts PPTX-style chart point arrays into the DOCX chart `values[]` shape. | { "series": [{ "dataPoints": [{ "category": "Q1", "value": 42 }] }] } | { "categories": ["Q1"], "series": [{ "values": [42] }] } |
## @paperjsx/json-to-xlsx

| Code | Path | Description | Legacy Shape | Modern Shape |
| --- | --- | --- | --- | --- |
| `XLSX_RELAXED_MERGES` | `sheets[].merges` | Promotes legacy `merges` arrays to `mergedCells`. | { "merges": ["A1:B1"] } | { "mergedCells": ["A1:B1"] } |
| `XLSX_RELAXED_FREEZE_PANE` | `sheets[].freezePane.column` | Renames legacy freezePane `column` to `col`. | { "freezePane": { "row": 1, "column": 1 } } | { "freezePane": { "row": 1, "col": 1 } } |
| `XLSX_RELAXED_META_SUBJECT` | `meta.subject` | Promotes legacy workbook `subject` to `description`. | { "meta": { "subject": "Pipeline review" } } | { "meta": { "description": "Pipeline review" } } |
| `XLSX_RELAXED_PRESET_NAME` | `style` | Maps legacy preset aliases onto the canonical preset catalog. | `"percent"` / `"alert"` | `"percentage"` / `"warning"` |
## @paperjsx/json-to-pdf

| Code | Path | Description | Legacy Shape | Modern Shape |
| --- | --- | --- | --- | --- |
| `PDF_RELAXED_TABLE_ROWS` | `children[].rows` | Converts legacy flat table rows into the supported header/body/footer cell-child shape. | { "rows": [{ "isHeader": true, "cells": [{ "value": "Header" }] }] } | { "header": [{ "cells": [{ "children": [{ "type": "paragraph", "value": "Header" }] }] }] } |
| `PDF_RELAXED_LIST_ITEMS` | `children[].items` | Maps legacy list `listType` and item `value` fields to `ordered` and `text`. | { "type": "list", "listType": "bullet", "items": [{ "value": "One" }] } | { "type": "list", "ordered": false, "items": [{ "text": "One" }] } |

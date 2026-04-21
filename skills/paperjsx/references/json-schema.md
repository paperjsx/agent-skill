# PaperJSX JSON Tool Reference

This file is generated from the Zod schemas in `packages/mcp-server/src/schemas`. Do not edit it by hand.

## PPTX Presentation

**Tool:** `generate_presentation`
**Engine:** `@paperjsx/json-to-pptx`
**Output:** `.pptx`

Create a presentation from structured slide content.

| Path | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `title` | string | yes | — | Presentation title |
| `author` | string | no | — | Author/presenter name |
| `company` | string | no | — | Company name |
| `date` | string | no | — | Presentation date |
| `slides` | array<object> | yes | — | Array of slide contents |
| `slides[].type [type="title"]` | literal "title" | yes | — | — |
| `slides[].title [type="title"]` | string | yes | — | Main title text |
| `slides[].subtitle [type="title"]` | string | no | — | Subtitle text |
| `slides[].background_image_url [type="title"]` | string (uri) | no | — | Background image URL |
| `slides[].type [type="content"]` | literal "content" | yes | — | — |
| `slides[].heading [type="content"]` | string | yes | — | Slide heading |
| `slides[].bullets [type="content"]` | array<string> | yes | — | Bullet points |
| `slides[].image_url [type="content"]` | string (uri) | no | — | Optional image to display |
| `slides[].image_position [type="content"]` | "left" \| "right" | yes | `"right"` | Image position relative to content |
| `slides[].type [type="chart"]` | literal "chart" | yes | — | — |
| `slides[].heading [type="chart"]` | string | yes | — | Slide heading |
| `slides[].chart [type="chart"]` | object | yes | — | Chart configuration |
| `slides[].chart.type [type="chart"]` | "line" \| "bar" \| "pie" \| "area" | yes | — | — |
| `slides[].chart.data [type="chart"]` | array<object> | yes | — | — |
| `slides[].chart.x_key [type="chart"]` | string | yes | — | — |
| `slides[].chart.y_keys [type="chart"]` | array<string> | yes | — | — |
| `slides[].chart.colors [type="chart"]` | array<string> | no | — | — |
| `slides[].caption [type="chart"]` | string | no | — | Chart caption or source |
| `slides[].type [type="two_column"]` | literal "two_column" | yes | — | — |
| `slides[].heading [type="two_column"]` | string | yes | — | Slide heading |
| `slides[].left [type="two_column"]` | array<string> | yes | — | Left column bullet points |
| `slides[].right [type="two_column"]` | array<string> | yes | — | Right column bullet points |
| `slides[].left_heading [type="two_column"]` | string | no | — | Left column sub-heading |
| `slides[].right_heading [type="two_column"]` | string | no | — | Right column sub-heading |
| `slides[].type [type="quote"]` | literal "quote" | yes | — | — |
| `slides[].quote [type="quote"]` | string | yes | — | Quote text |
| `slides[].attribution [type="quote"]` | string | no | — | Quote attribution/source |
| `slides[].background_color [type="quote"]` | string | no | — | Background color (hex) |
| `slides[].type [type="image"]` | literal "image" | yes | — | — |
| `slides[].heading [type="image"]` | string | no | — | Optional slide heading |
| `slides[].image_url [type="image"]` | string (uri) | yes | — | Main image URL |
| `slides[].caption [type="image"]` | string | no | — | Image caption |
| `slides[].fit [type="image"]` | "contain" \| "cover" \| "fill" | yes | `"contain"` | Image fit mode |
| `slides[].type [type="comparison"]` | literal "comparison" | yes | — | — |
| `slides[].heading [type="comparison"]` | string | yes | — | Slide heading |
| `slides[].items [type="comparison"]` | array<object> | yes | — | Comparison items |
| `slides[].items[].label [type="comparison"]` | string | yes | — | — |
| `slides[].items[].value [type="comparison"]` | string | yes | — | — |
| `slides[].items[].highlight [type="comparison"]` | boolean | no | — | — |
| `slides[].type [type="stats"]` | literal "stats" | yes | — | — |
| `slides[].heading [type="stats"]` | string | yes | — | Slide heading |
| `slides[].stats [type="stats"]` | array<object> | yes | — | Stats to display |
| `slides[].stats[].label [type="stats"]` | string | yes | — | Metric label |
| `slides[].stats[].value [type="stats"]` | string | yes | — | Metric value |
| `slides[].stats[].change [type="stats"]` | string | no | — | Change indicator (e.g., +15%) |
| `slides[].stats[].trend [type="stats"]` | "up" \| "down" \| "neutral" | no | — | — |
| `theme` | "corporate" \| "modern" \| "minimal" \| "dark" \| "gradient" | yes | `"corporate"` | Visual theme |
| `primary_color` | string | no | — | Primary brand color (hex) |
| `secondary_color` | string | no | — | Secondary accent color (hex) |
| `logo_url` | string (uri) | no | — | Company logo URL for slides |
| `aspect_ratio` | "16:9" \| "4:3" | yes | `"16:9"` | Slide aspect ratio |
| `include_slide_numbers` | boolean | yes | `true` | Show slide numbers |
| `include_footer` | boolean | yes | `true` | Show footer with company/date |
## PDF Report

**Tool:** `generate_report`
**Engine:** `@paperjsx/json-to-pdf`
**Output:** `.pdf`

Create a report PDF from markdown content and report metadata.

| Path | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `title` | string | yes | — | Report title displayed on cover page |
| `subtitle` | string | no | — | Report subtitle |
| `author` | string | no | — | Author name |
| `date` | string | no | — | Report date in ISO 8601 format (YYYY-MM-DD) |
| `version` | string | no | — | Document version (e.g., v1.0, Draft) |
| `content` | string | yes | — | Full markdown content for the report. Supports: - Headers (# to ######) with automatic hierarchy - Tables using GitHub Flavored Markdown (GFM) syntax - Code blocks with syntax highlighting (```language) - Images via URLs: ![alt](url) - Bullet lists (- or *) and numbered lists (1.) - Blockquotes (>) - Bold (**text**), italic (*text*), strikethrough (~~text~~) - Horizontal rules (---) - Links [text](url) |
| `include_toc` | boolean | yes | `true` | Auto-generate table of contents from headers |
| `include_cover` | boolean | yes | `true` | Generate a cover page with title/author |
| `page_numbers` | boolean | yes | `true` | Include page numbers in footer |
| `toc_depth` | number | yes | `3` | Maximum heading level to include in TOC |
| `theme` | "corporate" \| "modern" \| "minimal" \| "academic" \| "legal" | no | `"corporate"` | Visual theme for the report |
| `primary_color` | string | no | — | Hex color for headings and accents (e.g., #2563eb) |
| `font_family` | "sans" \| "serif" \| "mono" | yes | `"sans"` | Base font family |
| `page_format` | "a4" \| "letter" \| "legal" | yes | `"a4"` | Page size |
| `orientation` | "portrait" \| "landscape" | yes | `"portrait"` | Page orientation |
| `header_logo_url` | string (uri) | no | — | Logo URL for page headers |
| `footer_text` | string | no | — | Custom footer text |
## PDF Invoice

**Tool:** `generate_invoice`
**Engine:** `@paperjsx/json-to-pdf`
**Output:** `.pdf`

Create an invoice PDF from sender, recipient, and line-item data.

| Path | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `invoice_number` | string | yes | — | Unique invoice identifier (e.g., INV-2026-001) |
| `issue_date` | string | yes | — | Invoice issue date in ISO 8601 format (YYYY-MM-DD) |
| `due_date` | string | yes | — | Payment due date in ISO 8601 format (YYYY-MM-DD) |
| `from` | object | yes | — | Invoice sender/company information |
| `from.name` | string | yes | — | Company or person name |
| `from.address_line_1` | string | yes | — | Street address line 1 |
| `from.address_line_2` | string | no | — | Street address line 2 |
| `from.city` | string | yes | — | City |
| `from.state` | string | no | — | State/Province/Region |
| `from.postal_code` | string | yes | — | Postal/ZIP code |
| `from.country` | string | yes | — | Country name or ISO 3166-1 alpha-2 code |
| `from.email` | string (email) | no | — | Email address |
| `from.phone` | string | no | — | Phone number |
| `from.tax_id` | string | no | — | VAT/GST/Tax ID number |
| `from.logo_url` | string (uri) | no | — | URL to company logo image |
| `to` | object | yes | — | Invoice recipient/customer information |
| `to.name` | string | yes | — | Company or person name |
| `to.address_line_1` | string | yes | — | Street address line 1 |
| `to.address_line_2` | string | no | — | Street address line 2 |
| `to.city` | string | yes | — | City |
| `to.state` | string | no | — | State/Province/Region |
| `to.postal_code` | string | yes | — | Postal/ZIP code |
| `to.country` | string | yes | — | Country name or ISO 3166-1 alpha-2 code |
| `to.email` | string (email) | no | — | Email address |
| `to.phone` | string | no | — | Phone number |
| `to.tax_id` | string | no | — | VAT/GST/Tax ID number |
| `items` | array<object> | yes | — | List of invoice line items |
| `items[].description` | string | yes | — | Item or service description |
| `items[].quantity` | number | yes | — | Quantity of items |
| `items[].unit_price` | number | yes | — | Price per unit in the specified currency |
| `items[].tax_rate` | number | no | — | Line-item specific tax rate override (percentage) |
| `items[].discount` | number | no | — | Discount percentage for this line item |
| `currency` | "USD" \| "EUR" \| "GBP" \| "INR" \| "BRL" \| "AUD" \| "CAD" \| "JPY" \| "CNY" \| "CHF" \| "SGD" \| "HKD" | yes | `"USD"` | Currency for all amounts |
| `tax_rate` | number | yes | `0` | Default tax rate percentage |
| `discount_total` | number | no | — | Total discount amount |
| `shipping` | number | no | — | Shipping cost |
| `notes` | string | no | — | Additional notes, terms, or payment instructions |
| `payment_instructions` | string | no | — | Bank details or payment link |
| `purchase_order` | string | no | — | Customer PO number |
| `theme` | "corporate" \| "modern" \| "minimal" \| "academic" \| "legal" | yes | `"corporate"` | Visual theme for the invoice |
## PDF Chart Document

**Tool:** `generate_chart_document`
**Engine:** `@paperjsx/json-to-pdf`
**Output:** `.pdf`

Create a chart-focused PDF document with analysis and optional data tables.

| Path | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `title` | string | yes | — | Document title |
| `subtitle` | string | no | — | Document subtitle |
| `author` | string | no | — | Author name |
| `date` | string | no | — | Document date (ISO 8601) |
| `charts` | array<object> | yes | — | Array of chart configurations |
| `charts[].type` | "line" \| "bar" \| "pie" \| "area" \| "scatter" \| "composed" | yes | — | Type of chart to render |
| `charts[].title` | string | no | — | Chart title |
| `charts[].data` | array<object> | yes | — | Array of data points (objects with consistent keys) |
| `charts[].x_key` | string | yes | — | Key in data objects to use for X-axis |
| `charts[].y_keys` | array<string> | yes | — | Keys in data objects to use for Y-axis series |
| `charts[].colors` | array<string> | no | — | Hex colors for each Y-axis series |
| `charts[].show_legend` | boolean | yes | `true` | Display chart legend |
| `charts[].show_grid` | boolean | yes | `true` | Display grid lines |
| `charts[].y_axis_label` | string | no | — | Y-axis label |
| `charts[].x_axis_label` | string | no | — | X-axis label |
| `charts[].stacked` | boolean | no | — | Stack bars/areas (for bar and area charts) |
| `analysis_text` | string | no | — | Analysis or commentary markdown to include after charts |
| `key_insights` | array<string> | no | — | Bullet points of key insights to highlight |
| `include_data_table` | boolean | yes | `false` | Include raw data as a table below charts |
| `theme` | "corporate" \| "modern" \| "minimal" \| "academic" \| "legal" | yes | `"corporate"` | Visual theme |
| `page_format` | "a4" \| "letter" \| "legal" | yes | `"a4"` | Page size |
| `primary_color` | string | no | — | Primary accent color (hex) |
## DOCX Report

**Tool:** `generate_report_docx`
**Engine:** `@paperjsx/json-to-docx`
**Output:** `.docx`

Create a DOCX report with sections and an optional table of contents.

| Path | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `title` | string | yes | — | Report title |
| `subtitle` | string | no | — | Report subtitle |
| `author` | string | no | — | Author name |
| `date` | string | no | — | Report date (YYYY-MM-DD) |
| `sections` | array<object> | yes | — | Report sections |
| `sections[].heading` | string | yes | — | Section heading |
| `sections[].level` | integer | yes | `1` | Heading level (1-4) |
| `sections[].content` | string | yes | — | Section body text. Paragraphs separated by double newlines. |
| `sections[].bullets` | array<string> | no | — | Bullet points for this section |
| `include_toc` | boolean | yes | `true` | Include table of contents |
| `theme` | "corporate" \| "modern" \| "classic" \| "academic" \| "minimal" | yes | `"corporate"` | Visual theme |
| `page_size` | "a4" \| "letter" \| "legal" | yes | `"a4"` | Page size |
| `orientation` | "portrait" \| "landscape" | yes | `"portrait"` | Page orientation |
| `header_text` | string | no | — | Header text for all pages |
| `footer_text` | string | no | — | Footer text for all pages |
| `include_page_numbers` | boolean | yes | `true` | Include page numbers in footer |
## DOCX Contract

**Tool:** `generate_contract_docx`
**Engine:** `@paperjsx/json-to-docx`
**Output:** `.docx`

Create a DOCX contract with parties, clauses, and optional signature blocks.

| Path | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `title` | string | yes | — | Contract title (e.g., 'Software License Agreement') |
| `effective_date` | string | yes | — | Effective date (e.g., 'January 1, 2025') |
| `parties` | array<object> | yes | — | Contract parties (at least 2) |
| `parties[].name` | string | yes | — | Party legal name |
| `parties[].address` | string | yes | — | Party address |
| `parties[].role` | string | yes | — | Party role description (e.g., 'Licensor', 'Client') |
| `recitals` | array<string> | no | — | WHEREAS clauses / preamble statements |
| `clauses` | array<object> | yes | — | Contract clauses/sections |
| `clauses[].number` | string | yes | — | Clause number (e.g., '1', '2.1') |
| `clauses[].title` | string | yes | — | Clause title |
| `clauses[].content` | string | yes | — | Clause body text |
| `clauses[].subclauses` | array<object> | no | — | — |
| `clauses[].subclauses[].label` | string | yes | — | Subclause label (e.g., 'a', 'i') |
| `clauses[].subclauses[].content` | string | yes | — | — |
| `signatures` | array<object> | no | — | Signature blocks |
| `signatures[].name` | string | yes | — | Signatory name |
| `signatures[].title` | string | yes | — | Signatory title |
| `signatures[].party` | string | yes | — | Which party this signatory represents |
| `theme` | "corporate" \| "classic" \| "academic" | yes | `"classic"` | Visual theme |
| `page_size` | "a4" \| "letter" \| "legal" | yes | `"letter"` | Page size |
## DOCX Invoice

**Tool:** `generate_invoice_docx`
**Engine:** `@paperjsx/json-to-docx`
**Output:** `.docx`

Create a DOCX invoice with line items, taxes, and totals.

| Path | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `invoice_number` | string | yes | — | Invoice identifier (e.g., 'INV-2025-001') |
| `date` | string | yes | — | Invoice date |
| `due_date` | string | yes | — | Payment due date |
| `sender` | object | yes | — | Invoice sender / biller |
| `sender.name` | string | yes | — | Sender company name |
| `sender.address` | string | yes | — | Sender address |
| `sender.email` | string | no | — | Sender email |
| `sender.phone` | string | no | — | Sender phone |
| `sender.tax_id` | string | no | — | Tax ID / VAT number |
| `recipient` | object | yes | — | Invoice recipient / customer |
| `recipient.name` | string | yes | — | Recipient company/person name |
| `recipient.address` | string | yes | — | Recipient address |
| `recipient.email` | string | no | — | Recipient email |
| `recipient.tax_id` | string | no | — | Tax ID / VAT number |
| `items` | array<object> | yes | — | Invoice line items |
| `items[].description` | string | yes | — | Item description |
| `items[].quantity` | number | yes | — | Quantity |
| `items[].unit_price` | number | yes | — | Price per unit |
| `items[].amount` | number | yes | — | Line total (quantity x unit_price) |
| `subtotal` | number | yes | — | Subtotal before tax |
| `tax_rate` | number | no | — | Tax rate as decimal (e.g., 0.1 for 10%) |
| `tax_amount` | number | yes | — | Tax amount |
| `total` | number | yes | — | Total amount due |
| `currency` | string | yes | `"USD"` | Currency code (ISO 4217) |
| `notes` | string | no | — | Additional notes or payment instructions |
| `theme` | "corporate" \| "modern" \| "minimal" | yes | `"corporate"` | Visual theme |
| `page_size` | "a4" \| "letter" | yes | `"a4"` | Page size |
## XLSX Spreadsheet

**Tool:** `generate_spreadsheet`
**Engine:** `@paperjsx/json-to-xlsx`
**Output:** `.xlsx`

Create a spreadsheet workbook from structured sheet and cell data.

| Path | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `document` | object | yes | — | Spreadsheet document JSON matching @paperjsx/json-to-xlsx. |
| `output_filename` | string | no | — | — |
| `render_options` | object | no | — | — |
| `render_options.deterministic` | boolean | no | — | — |
| `render_options.large_dataset` | boolean | no | — | — |
| `render_options.row_chunk_size` | integer | no | — | — |
| `render_options.string_strategy` | "auto" \| "sharedStrings" \| "inlineStrings" | no | — | — |
| `validate_after_render` | boolean | yes | `true` | — |
| `attempt_repair_if_needed` | boolean | yes | `true` | — |

# PaperJSX Verified Examples

This file is generated from the same schemas and example fixtures used by `docs:verify` and `docs:render`. Do not edit it by hand.

## PPTX Presentation

**Tool:** `generate_presentation`
**Output:** `.pptx`

```jsonc
// verify: generate_presentation
{
  "title": "Q1 Business Review",
  "author": "Leadership Team",
  "company": "Acme Corp",
  "date": "2026-01-15",
  "slides": [
    {
      "type": "title",
      "title": "Q1 Business Review",
      "subtitle": "January 2026 snapshot"
    },
    {
      "type": "stats",
      "heading": "Key Metrics",
      "stats": [
        {
          "label": "Revenue",
          "value": "$1.8M",
          "change": "+12%",
          "trend": "up"
        },
        {
          "label": "Churn",
          "value": "1.4%",
          "change": "-0.2%",
          "trend": "down"
        }
      ]
    }
  ],
  "theme": "corporate",
  "aspect_ratio": "16:9",
  "include_slide_numbers": true,
  "include_footer": true
}
```
## PDF Report

**Tool:** `generate_report`
**Output:** `.pdf`

```jsonc
// verify: generate_report
{
  "title": "Q1 Engineering Review",
  "subtitle": "Operational summary",
  "author": "Platform Team",
  "date": "2026-01-15",
  "content": "# Summary\n\nWe improved deployment frequency and reduced incident recovery time.\n\n## Highlights\n\n- Deployment frequency increased by 18%\n- MTTR dropped below one hour",
  "include_toc": true,
  "include_cover": true,
  "page_numbers": true,
  "toc_depth": 3,
  "theme": "corporate",
  "page_format": "a4",
  "orientation": "portrait"
}
```
## PDF Invoice

**Tool:** `generate_invoice`
**Output:** `.pdf`

```jsonc
// verify: generate_invoice
{
  "invoice_number": "INV-2026-001",
  "issue_date": "2026-01-15",
  "due_date": "2026-02-14",
  "from": {
    "name": "Acme Software Inc.",
    "address_line_1": "123 Innovation Drive",
    "city": "San Francisco",
    "state": "CA",
    "postal_code": "94102",
    "country": "US",
    "email": "billing@acme.software"
  },
  "to": {
    "name": "TechCorp Ltd",
    "address_line_1": "456 Enterprise Blvd",
    "city": "New York",
    "state": "NY",
    "postal_code": "10001",
    "country": "US",
    "email": "accounts@techcorp.com"
  },
  "items": [
    {
      "description": "Enterprise software subscription",
      "quantity": 1,
      "unit_price": 12000
    }
  ],
  "currency": "USD",
  "tax_rate": 8.875,
  "theme": "modern"
}
```
## PDF Chart Document

**Tool:** `generate_chart_document`
**Output:** `.pdf`

```jsonc
// verify: generate_chart_document
{
  "title": "Revenue Trend Analysis",
  "subtitle": "Monthly performance",
  "date": "2026-01-15",
  "charts": [
    {
      "type": "line",
      "title": "Monthly Revenue",
      "data": [
        {
          "month": "Oct",
          "revenue": 42000
        },
        {
          "month": "Nov",
          "revenue": 48000
        },
        {
          "month": "Dec",
          "revenue": 53000
        }
      ],
      "x_key": "month",
      "y_keys": [
        "revenue"
      ],
      "colors": [
        "#2563eb"
      ],
      "show_legend": true,
      "show_grid": true
    }
  ],
  "key_insights": [
    "Revenue grew 26% across the quarter."
  ],
  "include_data_table": true,
  "theme": "corporate",
  "page_format": "a4"
}
```
## DOCX Report

**Tool:** `generate_report_docx`
**Output:** `.docx`

```jsonc
// verify: generate_report_docx
{
  "title": "Q1 Engineering Review",
  "subtitle": "Performance analysis",
  "author": "Engineering Team",
  "date": "2026-01-15",
  "sections": [
    {
      "heading": "Executive Summary",
      "level": 1,
      "content": "This quarter improved deployment speed and reliability.",
      "bullets": [
        "Deployment frequency increased by 18%",
        "MTTR dropped below one hour"
      ]
    }
  ],
  "include_toc": true,
  "theme": "corporate",
  "page_size": "a4",
  "orientation": "portrait",
  "include_page_numbers": true
}
```
## DOCX Contract

**Tool:** `generate_contract_docx`
**Output:** `.docx`

```jsonc
// verify: generate_contract_docx
{
  "title": "SOFTWARE LICENSE AGREEMENT",
  "effective_date": "January 15, 2026",
  "parties": [
    {
      "name": "Acme Corporation",
      "address": "123 Tech Street, San Francisco, CA 94102",
      "role": "Licensor"
    },
    {
      "name": "Beta Industries LLC",
      "address": "456 Innovation Ave, Austin, TX 78701",
      "role": "Licensee"
    }
  ],
  "clauses": [
    {
      "number": "1",
      "title": "Grant of License",
      "content": "Licensor grants Licensee a non-exclusive license to use the Software."
    }
  ],
  "signatures": [
    {
      "name": "John Smith",
      "title": "CEO",
      "party": "Acme Corporation"
    }
  ],
  "theme": "classic",
  "page_size": "letter"
}
```
## DOCX Invoice

**Tool:** `generate_invoice_docx`
**Output:** `.docx`

```jsonc
// verify: generate_invoice_docx
{
  "invoice_number": "INV-2026-042",
  "date": "2026-01-15",
  "due_date": "2026-02-14",
  "sender": {
    "name": "Northwind Studio",
    "address": "123 Maple Street\nSan Francisco, CA 94102",
    "email": "billing@example.com"
  },
  "recipient": {
    "name": "Acme Corporation",
    "address": "456 Customer Ave\nNew York, NY 10001",
    "email": "accounts@example.com"
  },
  "items": [
    {
      "description": "Design consultation",
      "quantity": 1,
      "unit_price": 299,
      "amount": 299
    }
  ],
  "subtotal": 299,
  "tax_amount": 26.16,
  "total": 325.16,
  "currency": "USD",
  "theme": "corporate",
  "page_size": "a4"
}
```
## XLSX Spreadsheet

**Tool:** `generate_spreadsheet`
**Output:** `.xlsx`

```jsonc
// verify: generate_spreadsheet
{
  "document": {
    "meta": {
      "title": "Quarterly Revenue",
      "creator": "PaperJSX MCP"
    },
    "sheets": [
      {
        "name": "Revenue",
        "rows": [
          {
            "cells": [
              {
                "value": "Quarter"
              },
              {
                "value": "Revenue"
              }
            ]
          },
          {
            "cells": [
              {
                "value": "Q1 2026"
              },
              {
                "value": 420000
              }
            ]
          }
        ]
      }
    ]
  },
  "validate_after_render": true,
  "attempt_repair_if_needed": true
}
```

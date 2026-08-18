# African Bank Holdings — Three-Year Financial Trend Analysis

## Business Problem

A growing balance sheet is often read as a sign of a healthy business — more assets, more lending, more customers. But growth alone doesn't guarantee profitability. This project asks a more specific question: is African Bank Holdings' balance sheet growth actually translating into stronger profits, or is it masking a cost problem underneath?

## Dataset

Audited Group Consolidated Annual Financial Statements for African Bank Holdings Limited, sourced directly from the company's published reports (africanbank.co.za). Two documents were used:

- FY2024 Group AFS (year ended 30 September 2024) — provides FY2024 actuals and restated FY2023 comparatives
- FY2025 Group AFS (year ended 30 September 2025) — provides FY2025 actuals and FY2024 comparatives

Using both documents gives three consecutive years (FY2023–FY2025) of consistently Group-consolidated data, rather than mixing standalone-entity and consolidated-entity figures.

## Data Extraction & a Note on Data Limitations

Balance Sheet and Income Statement figures were extracted directly from the audited PDF statements (Statement of Financial Position and Statement of Total Comprehensive Income), then structured into tables for analysis in SQL.

Two limitations are worth stating plainly:

- **FY2023 has only one source.** It comes from the FY2024 report's restated comparative column and could not be cross-checked against a second filing, unlike FY2024 (which appears in both reports).
- **A measurement adjustment exists between filings.** FY2024 figures differ slightly depending on which report they're pulled from — e.g., profit for the period is reported as R523m in the FY2024 filing itself, but restated to R517m in the FY2025 filing's comparative column, per a disclosed measurement period adjustment. This analysis uses the more recently restated figures throughout, on the basis that they represent the company's most current view of the numbers.

## Method

Seven ratios were calculated in SQL across all three years to examine growth, efficiency, asset quality, profitability, funding structure, and capital strength:

- Revenue and profit growth (YoY %)
- Net Interest Margin proxy (Net Interest Income ÷ Net Advances)
- Cost-to-Income Ratio (Operating Costs ÷ Total Income from Operations)
- Credit Loss Ratio (Credit Impairment Charge ÷ Net Advances)
- Return on Equity (Profit for the Period ÷ Total Equity)
- Funding Mix (Short-term Funding ÷ Total Funding)
- Equity-to-Assets Ratio (Total Equity ÷ Total Assets)

## Findings

The balance sheet grew steadily. Profit did not. Total assets rose from R48.3bn (FY2023) to R57.6bn (FY2025), and net advances grew from R31.8bn to R40.3bn over the same period — genuine, consistent growth. Revenue followed a similar pattern, dipping slightly in FY2024 before recovering in FY2025 (+4.89%).

Profit tells a very different story: it fell from R521m (FY2023) to R517m (FY2024) to just R274m (FY2025) — a 47% collapse in the final year, even as revenue grew. Return on Equity fell in step, from 4.21% to 2.11% over the same period. That's well below what shareholders typically require — bank cost-of-equity benchmarks commonly sit in the 12–18% range — so this isn't a marginal dip; it points to a profitability problem material enough to concern shareholders, not a rounding-level fluctuation.

| Metric | FY2023 | FY2024 | FY2025 |
|---|---|---|---|
| Revenue Growth | — | -5.88% | +4.89% |
| Profit Growth | — | -0.77% | -47.00% |
| Net Interest Margin | 17.99% | 15.04% | 12.16% |
| Cost-to-Income Ratio | 62.97% | 65.66% | 69.45% |
| Credit Loss Ratio | 10.26% | 7.59% | 6.06% |
| Return on Equity | 4.21% | 4.04% | 2.11% |
| Short-term Funding Mix | 75.15% | 74.58% | 69.16% |
| Equity-to-Assets | 25.65% | 25.95% | 22.50% |

Credit quality is not the problem — it's actually improving. The Credit Loss Ratio fell steadily from 10.26% to 6.06%, meaning a shrinking share of the loan book is being written off or provisioned for. Whatever is driving the profit decline, it isn't rising loan defaults.

Cost-to-Income Ratio is the clearest explanation. It climbed from 62.97% to 69.45% over three years — operating costs are consuming a steadily larger share of income each year. This closely matches the bank's own most recent interim results, which reported a cost-to-income ratio of 70% (up from 62% the prior year), independently corroborating this finding.

Net Interest Margin is also compressing (17.99% → 12.16%), meaning the loan book is generating proportionally less income per rand lent even as it grows in size — a second pressure point alongside rising costs.

The bank is also more leveraged than three years ago. Equity-to-Assets fell from 25.65% to 22.50%, meaning the balance sheet has grown faster than the equity base supporting it. This could reflect deliberate deleveraging or weaker capital growth — the available data can't fully distinguish between the two.

## Recommendation

The data points toward cost discipline and margin compression, not deteriorating credit risk — the Credit Loss Ratio has strengthened, not worsened, over the same period, so asset quality is an unlikely driver of the profit decline.

However, the improvement in credit metrics alongside compressing margins may also reflect a deliberate shift toward a lower-risk, lower-yield loan book, rather than a pure operating-efficiency problem. The published financial statements don't provide loan-book composition detail to fully separate these two explanations, so this should be treated as a plausible alternative rather than ruled out.

Either way, management attention should focus on the operating cost base and margin trajectory. This analysis is limited to top-level financial statement figures and does not have visibility into the underlying cost breakdown (staff costs, technology spend, marketing, etc.). A next step for internal analysis would be decomposing operating costs by category to identify which specific cost lines are driving the increase — that level of detail isn't available in the published summary statements used here.

## Dashboard

Four-page Power BI dashboard. Full interactive `.pbix` file is in [`/dashboard`](./dashboard).

### Page 1 — Overview

High-level FY2025 performance: revenue, assets, equity, profit, and the year-over-year profit decline.

<img width="1435" height="810" alt="image" src="https://github.com/user-attachments/assets/a701e41c-d2a0-4b5a-8661-f3a4a78ab27e" />


### Page 2 — Efficiency & Margin

Cost-to-Income and Net Interest Margin trends across FY2023–FY2025, isolating rising costs and margin compression as the profit driver.

![Efficiency and Margin](images/efficiency_margin.png)

### Page 3 — Asset Quality

Credit Loss Ratio trend, ruling out deteriorating loan quality as a cause of the profit decline.

![Asset Quality](images/asset_quality.png)

### Page 4 — Recommendation & Capital Position

Equity-to-Assets and short-term funding trends, plus the final recommendation and stated limitations.

![Recommendation and Capital Position](images/recommendation.png)

## Tools Used

- **Python** — PDF text extraction from audited financial statements
- **SQL** — ratio calculations across all three fiscal years
- **Power BI** — four-page interactive dashboard (DAX measures, trend visuals)

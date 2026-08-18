-- 1. Revenue and Profit Growth (Year-over-Year %)
SELECT
    ROUND(((SELECT `FY2024 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Total income from operations') -
           (SELECT `FY2023 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Total income from operations')) /
          (SELECT `FY2023 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Total income from operations') * 100, 2) AS Revenue_Growth_2024_pct,

    ROUND(((SELECT `FY2025 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Total income from operations') -
           (SELECT `FY2024 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Total income from operations')) /
          (SELECT `FY2024 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Total income from operations') * 100, 2) AS Revenue_Growth_2025_pct,

    ROUND(((SELECT `FY2024 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Profit for the period') -
           (SELECT `FY2023 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Profit for the period')) /
          (SELECT `FY2023 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Profit for the period') * 100, 2) AS Profit_Growth_2024_pct,

    ROUND(((SELECT `FY2025 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Profit for the period') -
           (SELECT `FY2024 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Profit for the period')) /
          (SELECT `FY2024 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Profit for the period') * 100, 2) AS Profit_Growth_2025_pct;

-- 2. Net Interest Margin proxy (NII ÷ Net Advances)
SELECT
    ROUND((SELECT `FY2023 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Net Interest Income') /
          (SELECT `FY2023 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Net advances') * 100, 2) AS NIM_2023_pct,
    ROUND((SELECT `FY2024 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Net Interest Income') /
          (SELECT `FY2024 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Net advances') * 100, 2) AS NIM_2024_pct,
    ROUND((SELECT `FY2025 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Net Interest Income') /
          (SELECT `FY2025 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Net advances') * 100, 2) AS NIM_2025_pct;

-- 3. Cost-to-Income Ratio (Operating Costs ÷ Total Income from Operations)
SELECT
    ROUND(ABS((SELECT `FY2023 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Operating costs')) /
          (SELECT `FY2023 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Total income from operations') * 100, 2) AS CostToIncome_2023_pct,
    ROUND(ABS((SELECT `FY2024 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Operating costs')) /
          (SELECT `FY2024 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Total income from operations') * 100, 2) AS CostToIncome_2024_pct,
    ROUND(ABS((SELECT `FY2025 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Operating costs')) /
          (SELECT `FY2025 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Total income from operations') * 100, 2) AS CostToIncome_2025_pct;

-- 4. Credit Loss Ratio (Credit Impairment Charge ÷ Net Advances)
SELECT
    ROUND(ABS((SELECT `FY2023 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Credit impairment charge')) /
          (SELECT `FY2023 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Net advances') * 100, 2) AS CreditLossRatio_2023_pct,
    ROUND(ABS((SELECT `FY2024 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Credit impairment charge')) /
          (SELECT `FY2024 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Net advances') * 100, 2) AS CreditLossRatio_2024_pct,
    ROUND(ABS((SELECT `FY2025 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Credit impairment charge')) /
          (SELECT `FY2025 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Net advances') * 100, 2) AS CreditLossRatio_2025_pct;

-- 5. Return on Equity (Profit for the Period ÷ Total Equity)
SELECT
    ROUND((SELECT `FY2023 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Profit for the period') /
          (SELECT `FY2023 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Total equity') * 100, 2) AS ROE_2023_pct,
    ROUND((SELECT `FY2024 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Profit for the period') /
          (SELECT `FY2024 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Total equity') * 100, 2) AS ROE_2024_pct,
    ROUND((SELECT `FY2025 (Rm)` FROM african_bank_income_statement WHERE `Line Item` = 'Profit for the period') /
          (SELECT `FY2025 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Total equity') * 100, 2) AS ROE_2025_pct;

-- 6. Funding Mix (Short-term Funding ÷ Total Funding)
SELECT
    ROUND((SELECT `FY2023 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Short-term funding') /
          ((SELECT `FY2023 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Short-term funding') +
           (SELECT `FY2023 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Long-term funding')) * 100, 2) AS ShortTermFundingMix_2023_pct,
    ROUND((SELECT `FY2024 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Short-term funding') /
          ((SELECT `FY2024 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Short-term funding') +
           (SELECT `FY2024 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Long-term funding')) * 100, 2) AS ShortTermFundingMix_2024_pct,
    ROUND((SELECT `FY2025 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Short-term funding') /
          ((SELECT `FY2025 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Short-term funding') +
           (SELECT `FY2025 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Long-term funding')) * 100, 2) AS ShortTermFundingMix_2025_pct;

-- 7. Equity-to-Assets Ratio (Total Equity ÷ Total Assets)
SELECT
    ROUND((SELECT `FY2023 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Total equity') /
          (SELECT `FY2023 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Total assets') * 100, 2) AS EquityToAssets_2023_pct,
    ROUND((SELECT `FY2024 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Total equity') /
          (SELECT `FY2024 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Total assets') * 100, 2) AS EquityToAssets_2024_pct,
    ROUND((SELECT `FY2025 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Total equity') /
          (SELECT `FY2025 (Rm)` FROM african_bank_balance_sheet WHERE `Line Item` = 'Total assets') * 100, 2) AS EquityToAssets_2025_pct;
-- Module 13 Lab — Sample Data (Instructor Reference)
-- Run after Module 09's create-tables-final.sql, against the same database.
-- Nothing else needs loading: the mission model is self-contained, and Module
-- 09 already seeds `advisors` (1=Priya Shah, 2=Daniel Osei, 3=Wei Zhang,
-- 4=Fatima Al-Rashid), which the advisor_id values below refer to.
--
-- The mission model's `instruments` holds only the columns Module 07's
-- normalization derived (ticker, name), not the enterprise schema's fuller
-- set. We load the same instrument universe in the same order as
-- shared/enterprise-schema.sql, so the SERIAL ids line up the same way:
-- 1=VOD.L, 2=BARC.L, 3=ULVR.L, 4=AAPL, 5=GILT10, 6=CORPB1, 7=GLBEQ1, 8=CASHGBP.

INSERT INTO instruments (ticker, name) VALUES
    ('VOD.L',  'Vodafone Group PLC'),
    ('BARC.L', 'Barclays PLC'),
    ('ULVR.L', 'Unilever PLC'),
    ('AAPL',   'Apple Inc'),
    ('GILT10', 'UK 10-Year Gilt'),
    ('CORPB1', 'Sterling Corporate Bond Fund'),
    ('GLBEQ1', 'Global Equity Index Fund'),
    ('CASHGBP','Cash (GBP)');

-- Model portfolios (same three from shared/messy-flat-file.csv, for continuity)
INSERT INTO model_portfolios (name) VALUES
    ('Balanced Growth'),
    ('Income Focus'),
    ('Adventurous Growth');

-- Target compositions (also matching messy-flat-file.csv)
INSERT INTO model_portfolio_holdings (model_portfolio_id, instrument_id, target_weight_pct) VALUES
    (1, 7, 40), (1, 6, 30), (1, 8, 30),   -- Balanced Growth
    (2, 6, 60), (2, 5, 30), (2, 8, 10),   -- Income Focus
    (3, 7, 70), (3, 5, 20), (3, 8, 10);   -- Adventurous Growth

-- Clients
INSERT INTO clients (name, advisor_id) VALUES
    ('Alice Johnson', 1),
    ('Brian Osei', 2),
    ('Carla Mendes', 1),
    ('David Kim', 3),
    ('Elena Petrova', 2);

-- Subscriptions (matching messy-flat-file.csv's client-to-portfolio mapping)
INSERT INTO client_subscriptions (client_id, model_portfolio_id, subscribed_date) VALUES
    (1, 1, '2023-01-15'),  -- Alice Johnson -> Balanced Growth
    (2, 3, '2023-03-01'),  -- Brian Osei -> Adventurous Growth
    (3, 2, '2022-11-01'),  -- Carla Mendes -> Income Focus
    (4, 3, '2023-06-01'),  -- David Kim -> Adventurous Growth
    (5, 1, '2022-09-01');  -- Elena Petrova -> Balanced Growth

-- Actual current holdings, deliberately drifted from target for at least one client
INSERT INTO client_holdings (client_id, instrument_id, quantity, as_of_date) VALUES
    (1, 7, 1200, '2026-06-30'),  -- Alice: Global Equity Fund units
    (1, 6, 600,  '2026-06-30'),  -- Alice: Corporate Bond Fund units
    (1, 8, 400,  '2026-06-30'),  -- Alice: Cash
    (3, 6, 3000, '2026-06-30'),  -- Carla: Corporate Bond Fund units
    (3, 5, 1200, '2026-06-30'),  -- Carla: Gilt units
    (4, 7, 5000, '2026-06-30'),  -- David: Global Equity Fund units, likely overweight vs target
    (4, 5, 300,  '2026-06-30'); -- David: Gilt units, likely underweight vs target

-- Module 09 Lab — Hardened Mission Model DDL (Instructor Reference)
--
-- The Model Portfolio service is a system in its own right, separate from the
-- enterprise schema of Modules 02-06. This file is self-contained: it owns
-- every table it references, so it loads into its own database and needs
-- nothing else present first.
--
--     CREATE DATABASE mission_portfolio;
--     \c mission_portfolio
--     \i create-tables-final.sql
--
-- Safe to import repeatedly: the DROP block rebuilds the model from scratch in
-- reverse dependency order, the same way shared/enterprise-schema.sql does.
-- client_trades is created in Module 14, and is dropped here so a rebuild
-- still works once the capstone has been run.

DROP TABLE IF EXISTS client_trades;
DROP TABLE IF EXISTS client_holdings;
DROP TABLE IF EXISTS client_subscriptions;
DROP TABLE IF EXISTS model_portfolio_holdings;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS model_portfolios;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS advisors;

-- The mission model's own advisor list, mirroring the enterprise schema's.
-- Owning it here is what keeps clients.advisor_id a real foreign key: a
-- foreign key cannot span two databases. Seeded so the ids match the
-- enterprise schema's (1=Priya Shah, 2=Daniel Osei, 3=Wei Zhang,
-- 4=Fatima Al-Rashid), which is what Module 13's sample data assumes.
CREATE TABLE advisors (
    advisor_id  SERIAL PRIMARY KEY,
    name        TEXT NOT NULL
);
INSERT INTO advisors (name) VALUES
    ('Priya Shah'),
    ('Daniel Osei'),
    ('Wei Zhang'),
    ('Fatima Al-Rashid');

CREATE TABLE clients (
    client_id   SERIAL PRIMARY KEY,
    name        TEXT NOT NULL,
    advisor_id  INTEGER NOT NULL REFERENCES advisors(advisor_id)
);
CREATE INDEX idx_clients_advisor_id ON clients(advisor_id);

CREATE TABLE model_portfolios (
    model_portfolio_id  SERIAL PRIMARY KEY,
    name                TEXT NOT NULL UNIQUE
);

CREATE TABLE instruments (
    instrument_id  SERIAL PRIMARY KEY,
    ticker         TEXT NOT NULL UNIQUE,
    name           TEXT NOT NULL
);

CREATE TABLE model_portfolio_holdings (
    model_portfolio_id  INTEGER NOT NULL REFERENCES model_portfolios(model_portfolio_id),
    instrument_id       INTEGER NOT NULL REFERENCES instruments(instrument_id),
    target_weight_pct   NUMERIC(5,2) NOT NULL CHECK (target_weight_pct BETWEEN 0 AND 100),
    PRIMARY KEY (model_portfolio_id, instrument_id)
);
CREATE INDEX idx_mph_instrument_id ON model_portfolio_holdings(instrument_id);

CREATE TABLE client_subscriptions (
    client_id           INTEGER NOT NULL REFERENCES clients(client_id),
    model_portfolio_id  INTEGER NOT NULL REFERENCES model_portfolios(model_portfolio_id),
    subscribed_date      DATE NOT NULL,
    PRIMARY KEY (client_id, model_portfolio_id, subscribed_date)
);
CREATE INDEX idx_cs_model_portfolio_id ON client_subscriptions(model_portfolio_id);

-- Part A: closing Module 08's gap
CREATE TABLE client_holdings (
    client_id      INTEGER NOT NULL REFERENCES clients(client_id),
    instrument_id  INTEGER NOT NULL REFERENCES instruments(instrument_id),
    quantity       NUMERIC(14,4) NOT NULL CHECK (quantity >= 0),
    as_of_date     DATE NOT NULL,
    PRIMARY KEY (client_id, instrument_id, as_of_date)
);
-- Primary key rationale: a client can hold the same instrument as of different
-- dates over time (this is a snapshot, not a running total), so client_id +
-- instrument_id alone isn't unique enough, as_of_date must be part of the key.
CREATE INDEX idx_ch_instrument_id ON client_holdings(instrument_id);

-- Part C.7: an additional index worth adding
-- Reporting on a client's current holdings vs their model portfolio's target
-- (the mission brief's core report) will filter client_holdings by client_id
-- and the most recent as_of_date constantly. client_id is already indexed as
-- part of the primary key, but a report frequently querying "most recent
-- as_of_date per client" benefits from:
CREATE INDEX idx_ch_client_asof ON client_holdings(client_id, as_of_date DESC);

-- Part C.8: a column deliberately NOT indexed
-- model_portfolios.name is UNIQUE (so it already has an index from that
-- constraint), but a column like clients.name would NOT be worth a
-- dedicated index here: this schema is small, name is rarely the sole
-- filter in a query (usually joined via client_id instead), and free-text
-- name search would need a different kind of index entirely (e.g. a trigram
-- index), not a plain B-tree.

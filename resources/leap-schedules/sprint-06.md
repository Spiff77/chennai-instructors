# Sprint 6 — Software Architecture & Enterprise Java

Spring Boot mission service, contract-first, MyBatis, JWT, containers.

**3 days · 13 modules · 1155 teaching minutes.**

**Day shape** — 09:00–17:00, opening with a 5-minute retrospective. Tea 10:30–10:45 and 15:00–15:15, lunch 12:15–13:15, leaving **385 teaching minutes** (175 morning + 210 afternoon). Break times are fixed, so a long lab occasionally runs across one; no lab is ever cut by lunch.

## Day 1

| Time | Module | Presentation | Demo | Lab | Total |
|---|---|---:|---:|---:|---:|
| 09:00–09:05 | _Daily retrospective_ | | | | 5 |
| 09:05–10:10 | **M01** Microservices & the Mission Service | 30 | 20 | 15 | **65** |
| 10:10–10:30 | **M02** Spring Boot Quickstart | 20 | — | — | **20** |
| 10:30–10:45 | _Break_ | | | | 15 |
| 10:45–11:50 | **M02** Spring Boot Quickstart _(cont.)_ | 10 | 25 | 30 | **65** |
| 11:50–12:15 | **M03** Layered Architecture in Spring Boot | 25 | — | — | **25** |
| 12:15–13:15 | _Lunch_ | | | | 60 |
| 13:15–14:15 | **M03** Layered Architecture in Spring Boot _(cont.)_ | — | 25 | 35 | **60** |
| 14:15–15:00 | **M04** REST API Design Principles | 25 | 20 | — | **45** |
| 15:00–15:15 | _Break_ | | | | 15 |
| 15:15–15:45 | **M04** REST API Design Principles _(cont.)_ | — | — | 30 | **30** |
| 15:45–17:00 | **M05** Contract-First Design with OpenAPI | 20 | 25 | 30 | **75** |
| | **Day 1 total** | **130** | **115** | **140** | **385** |

## Day 2

| Time | Module | Presentation | Demo | Lab | Total |
|---|---|---:|---:|---:|---:|
| 09:00–09:05 | _Daily retrospective_ | | | | 5 |
| 09:05–10:30 | **M06** DTOs & Request Validation | 25 | 20 | 40 | **85** |
| 10:30–10:45 | _Break_ | | | | 15 |
| 10:45–11:00 | **M06** DTOs & Request Validation _(cont.)_ | — | — | 15 | **15** |
| 11:00–12:00 | **M07** Persistence with MyBatis | 35 | 25 | — | **60** |
| 12:00–12:15 | _Extended lab time & practice_ | — | — | 15 | **15** |
| 12:15–13:15 | _Lunch_ | | | | 60 |
| 13:15–13:55 | **M07** Persistence with MyBatis _(cont.)_ | — | — | 40 | **40** |
| 13:55–15:00 | **M08** MyBatis in Context: vs JPA/Hibernate | 20 | 25 | 20 | **65** |
| 15:00–15:15 | _Break_ | | | | 15 |
| 15:15–17:00 | **M09** Securing the Service: JWT Validation | 30 | 30 | 45 | **105** |
| | **Day 2 total** | **110** | **100** | **175** | **385** |

## Day 3

| Time | Module | Presentation | Demo | Lab | Total |
|---|---|---:|---:|---:|---:|
| 09:00–09:05 | _Daily retrospective_ | | | | 5 |
| 09:05–10:30 | **M10** Handling Errors Gracefully | 25 | 20 | 40 | **85** |
| 10:30–10:45 | _Break_ | | | | 15 |
| 10:45–12:15 | **M11** Mission Build: Assembling the Full Service | 20 | 25 | 45 | **90** |
| 12:15–13:15 | _Lunch_ | | | | 60 |
| 13:15–15:00 | **M12** Containerising Spring Boot Services | 25 | 30 | 50 | **105** |
| 15:00–15:15 | _Break_ | | | | 15 |
| 15:15–17:00 | **M13** Mission Build: Containerise, Integration Test & Wrap-up | 20 | 25 | 60 | **105** |
| | **Day 3 total** | **90** | **100** | **195** | **385** |

## Time per module

| # | Module | Presentation | Demo | Lab | Total |
|---|---|---:|---:|---:|---:|
| 01 | Microservices & the Mission Service | 30 | 20 | 15 | **65** |
| 02 | Spring Boot Quickstart | 30 | 25 | 30 | **85** |
| 03 | Layered Architecture in Spring Boot | 25 | 25 | 35 | **85** |
| 04 | REST API Design Principles | 25 | 20 | 30 | **75** |
| 05 | Contract-First Design with OpenAPI | 20 | 25 | 30 | **75** |
| 06 | DTOs & Request Validation | 25 | 20 | 55 | **100** |
| 07 | Persistence with MyBatis | 35 | 25 | 40 | **100** |
| 08 | MyBatis in Context: vs JPA/Hibernate | 20 | 25 | 20 | **65** |
| 09 | Securing the Service: JWT Validation | 30 | 30 | 45 | **105** |
| 10 | Handling Errors Gracefully | 25 | 20 | 40 | **85** |
| 11 | Mission Build: Assembling the Full Service | 20 | 25 | 45 | **90** |
| 12 | Containerising Spring Boot Services | 25 | 30 | 50 | **105** |
| 13 | Mission Build: Containerise, Integration Test & Wrap-up | 20 | 25 | 60 | **105** |
| — | Extended lab time & practice | — | — | 15 | **15** |
| | **Total** | | | | **1155** |

## Notes

- Design and discussion labs (M01, M04, M08) are deliberately short; the infrastructure labs (M07, M12, M13) and mission builds carry the time.
- M09, M11 and M12 depend on external processes — auth stub, Postgres, Docker builds — and fail in environment-specific ways. Cut the M12/M13 presentations first if a day slips.


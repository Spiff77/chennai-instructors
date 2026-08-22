# Sprint 8 — Node.js / NestJS Authentication Service

JS and TypeScript from zero, then Node, NestJS and the auth service.

**2 days · 15 modules · 770 teaching minutes.**

**Day shape** — 09:00–17:00, opening with a 5-minute retrospective. Tea 10:30–10:45 and 15:00–15:15, lunch 12:15–13:15, leaving **385 teaching minutes** (175 morning + 210 afternoon). Break times are fixed, so a long lab occasionally runs across one; no lab is ever cut by lunch.

## Day 1

| Time | Module | Presentation | Demo | Lab | Total |
|---|---|---:|---:|---:|---:|
| 09:00–09:05 | _Daily retrospective_ | | | | 5 |
| 09:05–09:45 | **M01** Identity, Access Management & Zero-Trust | 15 | 10 | 15 | **40** |
| 09:45–10:30 | **M02** JavaScript Fundamentals | 20 | 15 | 10 | **45** |
| 10:30–10:45 | _Break_ | | | | 15 |
| 10:45–11:00 | **M02** JavaScript Fundamentals _(cont.)_ | — | — | 15 | **15** |
| 11:00–12:00 | **M03** Objects, Arrays & Modern JavaScript | 20 | 20 | 20 | **60** |
| 12:00–12:15 | **M04** Asynchronous JavaScript | 15 | — | — | **15** |
| 12:15–13:15 | _Lunch_ | | | | 60 |
| 13:15–13:45 | **M04** Asynchronous JavaScript _(cont.)_ | — | 15 | 15 | **30** |
| 13:45–14:25 | **M05** Introduction to TypeScript | 10 | 15 | 15 | **40** |
| 14:25–15:00 | **M06** The TypeScript Build Process | 10 | 10 | 15 | **35** |
| 15:00–15:15 | _Break_ | | | | 15 |
| 15:15–16:10 | **M07** TypeScript Deeper: Interfaces & Generics | 15 | 15 | 25 | **55** |
| 16:10–17:00 | **M08** Node.js Fundamentals | 15 | 15 | 20 | **50** |
| | **Day 1 total** | **120** | **115** | **150** | **385** |

## Day 2

| Time | Module | Presentation | Demo | Lab | Total |
|---|---|---:|---:|---:|---:|
| 09:00–09:05 | _Daily retrospective_ | | | | 5 |
| 09:05–09:55 | **M09** NestJS Fundamentals | 15 | 15 | 20 | **50** |
| 09:55–10:30 | **M10** DTOs & Validation in NestJS | 15 | 10 | 10 | **35** |
| 10:30–10:45 | _Break_ | | | | 15 |
| 10:45–10:55 | **M10** DTOs & Validation in NestJS _(cont.)_ | — | — | 10 | **10** |
| 10:55–12:00 | **M11** Auth Service Skeleton: Login, Register, Refresh | 15 | 15 | 35 | **65** |
| 12:00–12:15 | **M12** Secure DB Access & Password Hashing | 15 | — | — | **15** |
| 12:15–13:15 | _Lunch_ | | | | 60 |
| 13:15–14:05 | **M12** Secure DB Access & Password Hashing _(cont.)_ | — | 15 | 35 | **50** |
| 14:05–15:00 | **M13** JWT Essentials: Issuing & Validating Tokens | 15 | 15 | 25 | **55** |
| 15:00–15:15 | _Break_ | | | | 15 |
| 15:15–15:50 | **M14** Securing & Testing the Service | 10 | 10 | 15 | **35** |
| 15:50–17:00 | **M15** Mission Build: OpenAPI Docs & Replacing the Stub | 15 | 15 | 40 | **70** |
| | **Day 2 total** | **100** | **95** | **190** | **385** |

## Time per module

| # | Module | Presentation | Demo | Lab | Total |
|---|---|---:|---:|---:|---:|
| 01 | Identity, Access Management & Zero-Trust | 15 | 10 | 15 | **40** |
| 02 | JavaScript Fundamentals | 20 | 15 | 25 | **60** |
| 03 | Objects, Arrays & Modern JavaScript | 20 | 20 | 20 | **60** |
| 04 | Asynchronous JavaScript | 15 | 15 | 15 | **45** |
| 05 | Introduction to TypeScript | 10 | 15 | 15 | **40** |
| 06 | The TypeScript Build Process | 10 | 10 | 15 | **35** |
| 07 | TypeScript Deeper: Interfaces & Generics | 15 | 15 | 25 | **55** |
| 08 | Node.js Fundamentals | 15 | 15 | 20 | **50** |
| 09 | NestJS Fundamentals | 15 | 15 | 20 | **50** |
| 10 | DTOs & Validation in NestJS | 15 | 10 | 20 | **45** |
| 11 | Auth Service Skeleton: Login, Register, Refresh | 15 | 15 | 35 | **65** |
| 12 | Secure DB Access & Password Hashing | 15 | 15 | 35 | **65** |
| 13 | JWT Essentials: Issuing & Validating Tokens | 15 | 15 | 25 | **55** |
| 14 | Securing & Testing the Service | 10 | 10 | 15 | **35** |
| 15 | Mission Build: OpenAPI Docs & Replacing the Stub | 15 | 15 | 40 | **70** |
| | **Total** | | | | **770** |

## Notes

- **Two days does not hold this sprint.** The material is sized for three: a from-zero JS/TS foundation *and* the auth-service build.
- The build thread (M11, M12, M13, M15) was protected and paid for out of M05–M08.
- Recommended: move M06's tsconfig lab and M05's annotation lab to pre-work, and treat M15 Part 2 (integration test) as take-home.
- M15's lab needs `MISSION_SERVICE_DIR` pointing at each team's Sprint 6/7 checkout plus a running `sprint6-postgres` container — verify during Day 1 setup or it fails in the room.


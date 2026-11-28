# Hela

A friendlier terminal for African capital markets (NGX, JSE, EGX, NSE and later BRVM, GSE, DSE): TradingView class charting joined to Koyfin class research, built first for retail traders, retail investors and advisors. Institutions come later.

## Status
Phase 0: shell and design system. See docs/roadmap.md and the phase labels on GitHub issues.

## Repository map
| Path | Contents |
|---|---|
| apps/web | The terminal frontend |
| packages | Shared frontend packages: tokens, ui, data-client, function-codes, i18n |
| services | api-gateway (Go), stream-engine (Rust), batch (Python). Added from Phase 1 |
| proto, api | Contracts: protobuf and OpenAPI |
| db | Migrations and seeds |
| infra | Infrastructure as code and observability |
| tools | Developer tooling, mock feed |
| docs | Architecture, decisions, runbooks, licensing notes |

## Quick start
```
cp .env.example .env
make up          # Timescale, NATS, Redis
make install     # pnpm install
make check       # lint, typecheck, test, build
```
Requires Node 22+, pnpm, Docker.

## How we work
- Trunk based. main is always releasable. Work happens on short lived branches named type/short-description, for example feat/command-palette.
- Every change is a pull request, squash merged. Delete the branch after merge.
- Conventional Commits: feat, fix, chore, docs, refactor, test, perf. Scope by area, for example feat(web): add fx basis control.
- Contracts first: proto and OpenAPI changes go in their own commit.
- Every issue carries one phase label, one area label and one type label.
- Releases are tags: v0.1.0 at the end of Phase 0 and so on.

## Licensed data rule
Never commit exchange or vendor data. Use synthetic fixtures under fixtures/synthetic. CI blocks data files outside that path. See docs/data-licensing.md.

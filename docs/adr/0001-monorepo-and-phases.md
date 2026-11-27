# ADR 0001: Monorepo, phased delivery, trunk based development

Status: accepted

## Context
One small team ships a web app, three backend services and shared contracts. Contracts change often and must stay in sync across languages.

## Decision
- One monorepo with pnpm workspaces for the frontend and separate service folders for Go, Rust and Python.
- Delivery in phases, each tracked with phase labels and a gate.
- Trunk based development with short lived branches, squash merges and required checks.

## Consequences
- Contract changes are atomic across consumers.
- CI must stay fast, so jobs skip themselves when a service does not exist or is untouched.
- Moving a service to its own repo later is possible because folders are self contained.

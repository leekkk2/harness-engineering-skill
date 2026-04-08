---
name: harness-engineering
description: Set up systematic AI Agent Harness Engineering for any project. Creates a 5-layer .harness/ directory with pre-commit hooks, architecture drift detection, Sprint Contract multi-agent coordination, entropy management, and metrics. Use this skill PROACTIVELY whenever users mention harness engineering, agent constraints, architecture drift, AGENTS.md refactoring, multi-agent coordination, Sprint Contracts, context engineering, agent quality systems, or want to make AI-assisted coding more reliable and systematic. Also applies when setting up new projects for AI agent collaboration, improving existing agent workflows, or diagnosing why an AI agent keeps making the same mistakes.
---

# Harness Engineering

> "Agent = Model + Harness" — Everything except the model itself is the Harness.

Build systems that **constrain**, **inform**, **verify**, and **correct** AI agent behavior for any project.

## Core Principles

1. **Rippable**: Each component works independently; safely remove when models improve
2. **Incremental**: Learn from failures; add configuration only when problems emerge
3. **Feedback First**: Success is silent; failures are verbose
4. **Repo as Truth**: All harness configuration is version-controlled
5. **Simplicity First**: Find the simplest solution; add complexity only when needed
6. **Agent-Agnostic**: Core constraints decouple from specific agent platforms

## Four Pillars

| Pillar | Responsibility | Typical Implementation |
|--------|---------------|----------------------|
| Context Architecture | Progressive information disclosure | CLAUDE.md/AGENTS.md → .harness/context/ |
| Architectural Constraints | Constraint enforcement & verification | Linters, type checkers, layer rules, pre-commit hooks |
| Entropy Management | Periodic cleanup & drift detection | Drift detector, doc consistency, dependency audit |
| Persistent Memory | Cross-session state persistence | progress.md, feature_list.json, Sprint Contracts |

## 5-Layer Directory Structure

```
.harness/
├── README.md              # Harness usage guide
├── VERSION                # Harness version number
├── context/               # Layer 1: Domain context (loaded on demand)
│   ├── README.md          # Index and usage instructions
│   └── <domain>.md        # Domain knowledge modules (server/client/data/deploy...)
├── sensors/               # Layer 2: Feedback sensors
│   ├── pre-commit/        # Fast checks: lint + format + type-check
│   ├── ci/                # CI pipeline sensors
│   ├── drift/             # Architecture drift detection
│   └── eval/              # Agent output evaluation
├── agents/                # Layer 3: Multi-agent orchestration
│   ├── contracts/         # Sprint Contracts
│   │   ├── template.json  # Sprint Contract template
│   │   ├── active/        # Currently active contracts
│   │   └── archive/       # Completed contracts
│   ├── specializations/   # Sub-agent role definitions
│   └── workflows/         # Multi-agent workflow DAGs
├── entropy/               # Layer 4: Entropy management (periodic cleanup)
│   ├── drift-detector.sh
│   ├── doc-consistency.sh
│   ├── dependency-audit.sh
│   └── schedule.json
└── metrics/               # Layer 5: Metrics & observability
    ├── session-logger.sh
    ├── session-log.jsonl
    └── weekly-report.sh
```

## Execution Checklist

Implement progressively by phase. Each phase delivers independent value — stop anytime.

### Phase 0: Foundation (10-30 min)

- [ ] **P0.1** Assess current state: existing CLAUDE.md/AGENTS.md, CI/CD, tests, pre-commit hooks
- [ ] **P0.2** Create `.harness/` directory scaffold (use `templates/scaffold.sh`)
- [ ] **P0.3** Create `.harness/README.md` (use `templates/harness-readme.md`)
- [ ] **P0.4** Create `.harness/VERSION` with initial version `0.1.0`
- [ ] **P0.5** Add `.harness/` references in project navigation files (CLAUDE.md/AGENTS.md/CODEX.md)
- [ ] **P0.6** Exclude `*.jsonl` in `.gitignore` (log files should not be committed)
- [ ] **Verify**: `.harness/` directory exists with README; all existing agent configurations work

### Phase 1: Feedback Loops (core value, 1-4 hours)

#### 1A: Pre-commit Hooks

- [ ] **P1.1** Install husky + lint-staged (see `templates/pre-commit-setup.sh`)
- [ ] **P1.2** Configure lint-staged (organize by submodule/directory)
- [ ] **P1.3** Add commit-msg hook (validate `<type>(scope): <summary>` format)
- [ ] **Verify**: `git commit` auto-runs lint + format; non-compliant commit messages are rejected

#### 1B: Architecture Drift Detection

- [ ] **P1.4** Define drift rules in `rules.json` (use `templates/drift-rules.json`)
- [ ] **P1.5** Write layer check script (use `templates/check-layers.sh`)
- [ ] **P1.6** Write naming convention check script (customize for project)
- [ ] **P1.7** Create `run-all.sh` unified entry point
- [ ] **Verify**: Architecture violations are reported

#### 1C: CI Enhancement

- [ ] **P1.8** Add lint stage to CI
- [ ] **P1.9** Add architecture drift detection to CI (initially `allow_failure: true`)
- [ ] **Verify**: CI pipeline includes lint + drift detection stages

### Phase 2: Context Refactor (2-4 hours)

- [ ] **P2.1** Analyze current AGENTS.md/CLAUDE.md content, identify domain modules
- [ ] **P2.2** Split domain knowledge into `.harness/context/<domain>.md`
- [ ] **P2.3** Slim down navigation files (CLAUDE.md ≤ 50 lines, AGENTS.md ≤ 80 lines)
- [ ] **P2.4** Add `.harness/context/README.md` index
- [ ] **P2.5** Update reference paths in existing Skills/Agents
- [ ] **Verify**: Navigation files are concise; domain knowledge is accessible on demand; existing workflows unbroken

### Phase 3: Agent Orchestration (1-2 days)

- [ ] **P3.1** Create Sprint Contract template (use `templates/sprint-contract.json`)
- [ ] **P3.2** Create `active/` and `archive/` directories
- [ ] **P3.3** Validate the Contract workflow with a real task
- [ ] **P3.4** Define multi-agent workflow DAGs (feature-development, bug-fix)
- [ ] **P3.5** (Optional) Create specialized sub-agents: harness-evaluator, entropy-cleaner
- [ ] **Verify**: Can define, execute, and evaluate a complete feature through Sprint Contract

### Phase 4: Entropy & Metrics (1 day)

- [ ] **P4.1** Write drift-detector.sh (comprehensive architecture drift detection)
- [ ] **P4.2** Write doc-consistency.sh (documentation-code consistency check)
- [ ] **P4.3** Write dependency-audit.sh (dependency audit)
- [ ] **P4.4** Create schedule.json (scheduling configuration)
- [ ] **P4.5** Write session-logger.sh (session logging)
- [ ] **P4.6** Write weekly-report.sh (weekly report generation)
- [ ] **Verify**: All scripts run independently; session logs append correctly; weekly reports generate

### Phase 5: Continuous Evolution (ongoing)

- [ ] **P5.1** Every time an agent makes an error → update the corresponding Guide or Sensor
- [ ] **P5.2** Weekly review of drift reports, adjust rule strictness
- [ ] **P5.3** Monthly audit of harness components, remove unnecessary complexity
- [ ] **P5.4** When models upgrade, re-evaluate whether each harness component is still necessary

## Context Architecture Design Guide

### Three-Tier Context System

| Tier | Content | Loading Strategy |
|------|---------|-----------------|
| Tier 1: Hot Memory | CLAUDE.md/AGENTS.md — project overview, navigation, core constraints | Auto-loaded |
| Tier 2: Domain Expert | .harness/context/ — on-demand domain knowledge | Loaded on demand |
| Tier 3: Cold Memory | Research docs, specifications, historical archives | Retrieval-triggered |

### Navigation File Design Principles

- CLAUDE.md answers "where do I look?", not "what do I know?"
- Keep it concise (ideal < 60 lines) — it's a navigation document, not a knowledge base
- Progressive Disclosure prevents context pollution
- Context window utilization should stay at 40-60%

### Domain Module Structure

Each `.harness/context/<domain>.md` follows this structure:

```markdown
---
domain: <domain-name>
updated: <date>
triggers: ["keyword1", "keyword2", ...]
---

# <Domain> Development Context

## Architectural Constraints
(Hard rules for this domain)

## Key Patterns
(Common code patterns and conventions)

## Common Pitfalls
(Mistakes agents frequently make and how to correct them)
```

## Control System Taxonomy

### Feedforward Controls (Guides)
- Anticipate agent behavior before execution
- Examples: architecture docs, coding guidelines, Skills, scaffolding scripts

### Feedback Controls (Sensors)
- Observe results after execution
- Examples: linters, tests, type checkers, architecture drift detection

### Two Verification Types

| Type | Method | Speed | Reliability | Cost |
|------|--------|-------|-------------|------|
| Computational | Tests, linters, type checkers | ms-seconds | Deterministic | Minimal |
| Inferential | AI review, semantic judgment | seconds-minutes | Non-deterministic | Significant |

**Prefer computational controls** — they are fast, reliable, and low-cost. Use inferential controls only when computational ones cannot cover the need.

## Sprint Contract Mechanism

Sprint Contracts are the core mechanism for multi-agent coordination. Before implementation, participating agents negotiate a contract:

```json
{
  "id": "sprint-<date>-<seq>",
  "objective": "One-line description of the goal",
  "scope": {
    "modules": ["paths allowed to modify"],
    "read_only": ["read-only paths"],
    "forbidden": ["paths that must not be touched"]
  },
  "success_criteria": [
    { "id": "SC-1", "description": "...", "verification": "..." }
  ],
  "constraints": ["constraint 1", "constraint 2"],
  "agents": {
    "generator": { "model": "...", "context": "..." },
    "evaluator": { "model": "...", "context": "..." }
  }
}
```

Full template available at `templates/sprint-contract.json`.

## Key Metrics

| Metric | Description | Target |
|--------|-------------|--------|
| Agent PR Throughput | PRs/day/engineer | ≥ 2.0 |
| First-Pass Rate | Proportion of agent output needing no human correction | ≥ 60% |
| Iteration Count | Average rounds to reach acceptance criteria | ≤ 3 |
| Context Efficiency | Effective context utilization ratio | ≥ 50% |
| Drift Index | Architecture violation count trend | Continuously declining |

## Implementation Level Reference

| Level | Scope | Content | Investment |
|-------|-------|---------|------------|
| Level 1 | Individual | CLAUDE.md + pre-commit hooks + tests | 1-2 hours |
| Level 2 | Team | + AGENTS.md + CI constraints + shared templates | 1-2 days |
| Level 3 | Organization | + custom middleware + observability + harness versioning | 1-2 weeks |

## Anti-Patterns

- Pre-designing ideal configuration before encountering real failures
- Installing tools "just in case"
- Treating the harness as static and unchanging
- Vague documentation that doesn't constrain behavior
- Storing critical knowledge outside the repository
- Over-engineering control flows

## Template Files

| File | Purpose | When to Use |
|------|---------|-------------|
| `templates/scaffold.sh` | Create .harness/ directory scaffold | Phase 0 |
| `templates/harness-readme.md` | .harness/README.md template | Phase 0 |
| `templates/drift-rules.json` | Architecture drift rule definitions | Phase 1B |
| `templates/check-layers.sh` | Module layer check script | Phase 1B |
| `templates/pre-commit-setup.sh` | husky + lint-staged installer | Phase 1A |
| `templates/sprint-contract.json` | Sprint Contract template | Phase 3 |
| `templates/session-log-format.jsonl` | Session log format example | Phase 4 |
| `templates/schedule.json` | Entropy management schedule | Phase 4 |

## References

See `references/sources.md` for the full list. Core sources:

- [OpenAI: Harness Engineering](https://openai.com/index/harness-engineering/)
- [Anthropic: Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)
- [Fowler/Thoughtworks: Harness Engineering](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html)
- [HumanLayer: Skill Issue](https://www.humanlayer.dev/blog/skill-issue-harness-engineering-for-coding-agents)

## When NOT to Use

- One-off scripts or throwaway tasks — no harness needed
- Purely human-driven projects — harness engineering is designed for AI agent collaboration
- Model selection & prompt engineering — harness engineering covers everything *except* the model

# Harness Engineering Skill

> A reusable AI agent skill for setting up systematic harness engineering in any project.

## What is Harness Engineering?

> "Agent = Model + Harness" — Everything except the model itself is the Harness.

Harness Engineering is the discipline of designing systems that **constrain**, **inform**, **verify**, and **correct** AI agent behavior. LangChain improved from 52.8% to 66.5% on benchmarks by modifying only the harness (no model changes), jumping from Top 30 to Top 5.

## Quick Start

### Claude Code

```bash
# As a project skill
cp -r . <your-project>/.claude/skills/harness-engineering/

# As a global skill
cp -r . ~/.claude/skills/harness-engineering/
```

### Any Agent Platform

Read `SKILL.md` and follow the execution checklist. The skill is agent-platform agnostic.

## What's Included

```
├── SKILL.md                 # Core skill definition (agent reads this)
├── templates/               # Reusable templates
│   ├── scaffold.sh          # .harness/ directory scaffolding
│   ├── harness-readme.md    # README template
│   ├── drift-rules.json     # Architecture drift rules
│   ├── check-layers.sh      # Module layer checking script
│   ├── pre-commit-setup.sh  # husky + lint-staged installer
│   ├── sprint-contract.json # Sprint Contract template
│   ├── session-log-format.jsonl  # Session log format
│   └── schedule.json        # Entropy management schedule
└── references/              # Authoritative sources
    └── sources.md
```

## The 5-Layer Framework

```
.harness/
├── context/       Layer 1: Domain context (progressive disclosure)
├── sensors/       Layer 2: Feedback loops (lint, drift, eval)
├── agents/        Layer 3: Multi-agent orchestration (Sprint Contracts)
├── entropy/       Layer 4: Entropy management (drift detection, cleanup)
└── metrics/       Layer 5: Observability (session logs, weekly reports)
```

## 6-Phase Implementation

| Phase | What | Time |
|-------|------|------|
| 0: Foundation | Directory scaffold + navigation updates | 10-30 min |
| 1: Feedback Loops | Pre-commit hooks + drift detection + CI | 1-4 hours |
| 2: Context Refactor | Split AGENTS.md into layered context modules | 2-4 hours |
| 3: Agent Orchestration | Sprint Contracts + multi-agent workflows | 1-2 days |
| 4: Entropy & Metrics | Drift management + session logging | 1 day |
| 5: Evolution | Continuous improvement | Ongoing |

## Core Principles

1. **Rippable** — Each component works independently; remove when models improve
2. **Incremental** — Learn from failures; add config only when problems emerge
3. **Feedback First** — Success is silent; failures are verbose
4. **Repo as Truth** — All harness config is version-controlled
5. **Simplicity First** — Find the simplest solution; add complexity only when needed
6. **Agent-Agnostic** — Core constraints decouple from specific agent platforms

## Theoretical Foundation

Based on comprehensive research from:

- **OpenAI**: [Harness Engineering](https://openai.com/index/harness-engineering/) — 1M LOC, 3-person team, 3.5 PRs/engineer/day
- **Anthropic**: [Effective harnesses](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) — Initializer + Coding Agent pattern
- **Anthropic**: [Harness design](https://www.anthropic.com/engineering/harness-design-long-running-apps) — Planner + Generator + Evaluator
- **Thoughtworks**: [Harness Engineering](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html) — Guides + Sensors cybernetic model
- **HumanLayer**: [Skill Issue](https://www.humanlayer.dev/blog/skill-issue-harness-engineering-for-coding-agents) — "It's a configuration problem, not a model problem"
- **awesome-harness-engineering**: [Resource collection](https://github.com/walkinglabs/awesome-harness-engineering)

## License

[MIT](LICENSE)

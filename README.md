# Harness Engineering Skill

> A reusable AI agent skill for setting up systematic harness engineering in any project.

[简体中文](#简体中文) | [English](#english)

---

## English

### What is Harness Engineering?

> "Agent = Model + Harness" — Everything except the model itself is the Harness.

Harness Engineering is the discipline of designing systems that **constrain**, **inform**, **verify**, and **correct** AI agent behavior. 2025 proved AI agents can write code; 2026 proved the bottleneck isn't model capability — it's harness quality.

LangChain improved from 52.8% to 66.5% on benchmarks by modifying only the harness (no model changes), jumping from Top 30 to Top 5.

### Quick Start

#### Claude Code

```bash
# As project skill
cp -r . <your-project>/.claude/skills/harness-engineering/

# As global skill
cp -r . ~/.claude/skills/harness-engineering/
```

#### Any Agent Platform

Read `SKILL.md` and follow the execution checklist. The skill is agent-platform agnostic.

### What's Included

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

### The 5-Layer Framework

```
.harness/
├── context/       Layer 1: Domain context (progressive disclosure)
├── sensors/       Layer 2: Feedback loops (lint, drift, eval)
├── agents/        Layer 3: Multi-agent orchestration (Sprint Contracts)
├── entropy/       Layer 4: Entropy management (drift detection, cleanup)
└── metrics/       Layer 5: Observability (session logs, weekly reports)
```

### 6-Phase Implementation

| Phase | What | Time |
|-------|------|------|
| 0: Foundation | Directory scaffold + navigation updates | 10-30 min |
| 1: Feedback Loops | Pre-commit hooks + drift detection + CI | 1-4 hours |
| 2: Context Refactor | Split AGENTS.md into layered context modules | 2-4 hours |
| 3: Agent Orchestration | Sprint Contracts + multi-agent workflows | 1-2 days |
| 4: Entropy & Metrics | Drift management + session logging | 1 day |
| 5: Evolution | Continuous improvement | Ongoing |

### Core Principles

1. **Rippable** — Each component works independently; remove when models improve
2. **Incremental** — Learn from failures; add config only when problems emerge
3. **Feedback First** — Success is silent; failures are verbose
4. **Repo as Truth** — All harness config is version-controlled
5. **Simplicity First** — Find the simplest solution; add complexity only when needed
6. **Agent-Agnostic** — Core constraints decouple from specific agent platforms

### Theoretical Foundation

Based on comprehensive research from:

- **OpenAI**: [Harness Engineering](https://openai.com/index/harness-engineering/) — 1M LOC, 3-person team, 3.5 PRs/engineer/day
- **Anthropic**: [Effective harnesses](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) — Initializer + Coding Agent pattern
- **Anthropic**: [Harness design](https://www.anthropic.com/engineering/harness-design-long-running-apps) — Planner + Generator + Evaluator
- **Thoughtworks**: [Harness Engineering](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html) — Guides + Sensors cybernetic model
- **HumanLayer**: [Skill Issue](https://www.humanlayer.dev/blog/skill-issue-harness-engineering-for-coding-agents) — "It's a configuration problem, not a model problem"
- **awesome-harness-engineering**: [Resource collection](https://github.com/walkinglabs/awesome-harness-engineering)

### License

[MIT](LICENSE)

---

## 简体中文

### 什么是 Harness Engineering？

> "Agent = Model + Harness" — 除模型本身以外的一切都是 Harness。

Harness Engineering 是设计和实现约束、告知、验证、纠正 AI Agent 行为的系统工程。LangChain 仅修改 Harness（不换模型）就从 52.8% 提升到 66.5%。

### 快速开始

```bash
# Claude Code 项目技能
cp -r . <your-project>/.claude/skills/harness-engineering/

# 或全局技能
cp -r . ~/.claude/skills/harness-engineering/
```

任何 Agent 平台均可使用——直接阅读 `SKILL.md` 并按执行清单操作。

### 核心流程

分 6 阶段渐进实施，每阶段独立交付价值：

| 阶段 | 内容 | 投入 |
|------|------|------|
| Phase 0 | 目录骨架 + 导航文件 | 10-30 分钟 |
| Phase 1 | Pre-commit + 漂移检测 + CI | 1-4 小时 |
| Phase 2 | AGENTS.md 拆分为分层上下文 | 2-4 小时 |
| Phase 3 | Sprint Contract + 多代理编排 | 1-2 天 |
| Phase 4 | 熵管理 + 度量系统 | 1 天 |
| Phase 5 | 持续迭代改进 | 持续 |

### 设计原则

1. **可拆卸**: 每个组件独立工作，模型改进后可安全移除
2. **渐进式**: 从失败中学习，只在遇到问题时添加配置
3. **反馈优先**: 成功静默，失败详报
4. **仓库即真相**: 所有配置版本控制
5. **平台无关**: 核心约束与具体 Agent 平台解耦

### 许可

[MIT](LICENSE)

# Harness Engineering References

## Foundational Theory

| Resource | Author/Source | Core Value |
|----------|--------------|------------|
| [Harness Engineering](https://openai.com/index/harness-engineering/) | OpenAI | Original definition: 1M LOC, 3-person team, 3.5 PRs/engineer/day |
| [Unlocking the Codex Harness](https://openai.com/index/unlocking-the-codex-harness/) | OpenAI | App Server architecture details |
| [Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) | Anthropic | Dual-agent system: Initializer + Coding Agent |
| [Harness design for long-running apps](https://www.anthropic.com/engineering/harness-design-long-running-apps) | Anthropic | Three-agent system: Planner + Generator + Evaluator |
| [Harness Engineering for coding agents](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html) | Fowler/Thoughtworks | Cybernetic model: Guides + Sensors |
| [Building effective agents](https://www.anthropic.com/engineering/building-effective-agents) | Anthropic | Agent design fundamentals |

## Context Engineering

| Resource | Core Value |
|----------|------------|
| [Effective context engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) | Context window is a working memory budget, not a dumping ground |
| [Context Engineering from Manus](https://manus.im/blog/Context-Engineering-for-AI-Agents-Lessons-from-Building-Manus) | KV-cache locality, tool masking, filesystem memory |
| [Writing a good CLAUDE.md](https://www.humanlayer.dev/blog/writing-a-good-claude-md) | CLAUDE.md best practices |

## Constraints & Safety

| Resource | Core Value |
|----------|------------|
| [Claude Code sandboxing](https://www.anthropic.com/engineering/claude-code-sandboxing) | Sandboxing and policy design |
| [Writing tools for agents](https://www.anthropic.com/engineering/writing-tools-for-agents) | Agent tool interface design |

## Specifications & Workflows

| Resource | Core Value |
|----------|------------|
| [AGENTS.md specification](https://github.com/agentsmd/agents.md) | Repository-level agent instruction open format |
| [12 Factor Agents](https://www.humanlayer.dev/blog/12-factor-agents) | Agent operational principles |
| [Skill Issue: Harness Engineering](https://www.humanlayer.dev/blog/skill-issue-harness-engineering-for-coding-agents) | Configuration problem vs model problem |

## Evaluation & Observability

| Resource | Core Value |
|----------|------------|
| [Demystifying Evals for AI Agents](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents) | Multi-trajectory success/failure metrics |
| [LangChain: Improving with harness engineering](https://blog.langchain.com/improving-deep-agents-with-harness-engineering/) | Harness-only changes can improve benchmark performance |

## Runtimes & Reference Implementations

| Resource | Core Value |
|----------|------------|
| [awesome-harness-engineering](https://github.com/walkinglabs/awesome-harness-engineering) | Comprehensive resource collection |
| [learn-harness-engineering](https://github.com/walkinglabs/learn-harness-engineering) | Project-based curriculum |
| [Harness Evolver](https://github.com/raphaelchristi/harness-evolver) | Auto-evolving harness plugin for Claude Code |

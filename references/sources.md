# Harness Engineering 参考资源

## 基础理论

| 资源 | 作者/来源 | 核心价值 |
|------|-----------|----------|
| [Harness Engineering](https://openai.com/index/harness-engineering/) | OpenAI | 原始定义: 1M LOC, 3人团队, 3.5 PR/人/天 |
| [Unlocking the Codex Harness](https://openai.com/index/unlocking-the-codex-harness/) | OpenAI | App Server 架构细节 |
| [Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) | Anthropic | 双代理系统: Initializer + Coding Agent |
| [Harness design for long-running apps](https://www.anthropic.com/engineering/harness-design-long-running-apps) | Anthropic | 三代理系统: Planner + Generator + Evaluator |
| [Harness Engineering for coding agents](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html) | Fowler/Thoughtworks | Cybernetic 模型: Guides + Sensors |
| [Building effective agents](https://www.anthropic.com/engineering/building-effective-agents) | Anthropic | Agent 设计基础 |

## 上下文工程

| 资源 | 核心价值 |
|------|----------|
| [Effective context engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) | 上下文窗口是工作记忆预算，不是垃圾场 |
| [Context Engineering from Manus](https://manus.im/blog/Context-Engineering-for-AI-Agents-Lessons-from-Building-Manus) | KV-cache 局部性, 工具遮罩, 文件系统记忆 |
| [Writing a good CLAUDE.md](https://www.humanlayer.dev/blog/writing-a-good-claude-md) | CLAUDE.md 最佳实践 |

## 约束与安全

| 资源 | 核心价值 |
|------|----------|
| [Claude Code sandboxing](https://www.anthropic.com/engineering/claude-code-sandboxing) | 沙箱与策略设计 |
| [Writing tools for agents](https://www.anthropic.com/engineering/writing-tools-for-agents) | Agent 工具接口设计 |

## 规格与工作流

| 资源 | 核心价值 |
|------|----------|
| [AGENTS.md specification](https://github.com/agentsmd/agents.md) | 仓库级 Agent 指令开放格式 |
| [12 Factor Agents](https://www.humanlayer.dev/blog/12-factor-agents) | Agent 操作原则 |
| [Skill Issue: Harness Engineering](https://www.humanlayer.dev/blog/skill-issue-harness-engineering-for-coding-agents) | 配置问题 vs 模型问题 |

## 评估与可观测

| 资源 | 核心价值 |
|------|----------|
| [Demystifying Evals for AI Agents](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents) | 多轨迹成败度量 |
| [LangChain: Improving with harness engineering](https://blog.langchain.com/improving-deep-agents-with-harness-engineering/) | 仅改 Harness 就能提升基准性能 |

## 运行时与参考实现

| 资源 | 核心价值 |
|------|----------|
| [awesome-harness-engineering](https://github.com/walkinglabs/awesome-harness-engineering) | 综合资源列表 |
| [learn-harness-engineering](https://github.com/walkinglabs/learn-harness-engineering) | 项目制课程 |
| [Harness Evolver](https://github.com/raphaelchristi/harness-evolver) | 自动进化 Harness 的 Claude Code 插件 |

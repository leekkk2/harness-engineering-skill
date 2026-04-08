---
name: harness-engineering
description: Set up systematic AI Agent Harness Engineering for any project. Includes 5-layer .harness/ directory structure, pre-commit hooks, architecture drift detection, Sprint Contract multi-agent coordination, entropy management and metrics. Trigger when users mention harness engineering, agent constraints, architecture drift, AGENTS.md refactoring, multi-agent coordination, Sprint Contract, context engineering, agent quality systems, or simply want to "make AI coding more reliable". 为任意项目搭建 AI Agent Harness 工程体系。
---

# Harness Engineering

> "Agent = Model + Harness" — 除模型本身以外的一切都是 Harness。

为任意项目搭建约束 (constrain)、告知 (inform)、验证 (verify)、纠正 (correct) AI Agent 行为的系统工程。

## 核心理念

1. **可拆卸 (Rippable)**: 每个组件独立工作，模型改进后可安全移除
2. **渐进式 (Incremental)**: 从失败中学习，只在遇到问题时添加配置
3. **反馈优先 (Feedback First)**: 成功静默，失败详报
4. **仓库即真相 (Repo as Truth)**: 所有 Harness 配置版本控制
5. **简单优先 (Simplicity First)**: 找到最简方案，只在必要时增加复杂度
6. **平台无关 (Agent-Agnostic)**: 核心约束与具体 Agent 平台解耦

## 四大支柱

| 支柱 | 职责 | 典型实现 |
|------|------|----------|
| Context Architecture | 渐进式信息披露 | CLAUDE.md/AGENTS.md → .harness/context/ |
| Architectural Constraints | 约束执行与验证 | linter, type checker, 分层规则, pre-commit |
| Entropy Management | 定期清理与漂移检测 | drift-detector, doc-consistency, dependency-audit |
| Persistent Memory | 跨会话状态持久化 | progress.md, feature_list.json, Sprint Contract |

## 五层目录结构

```
.harness/
├── README.md              # Harness 使用指南
├── VERSION                # Harness 版本号
├── context/               # Layer 1: 领域上下文（按需加载）
│   ├── README.md          # 索引与使用说明
│   └── <domain>.md        # 领域知识模块（server/client/data/deploy...）
├── sensors/               # Layer 2: 反馈传感器
│   ├── pre-commit/        # 快速检查: lint + format + type-check
│   ├── ci/                # CI pipeline sensors
│   ├── drift/             # 架构漂移检测
│   └── eval/              # Agent 输出评估
├── agents/                # Layer 3: 多代理编排
│   ├── contracts/         # Sprint Contracts
│   │   ├── template.json  # Sprint Contract 模板
│   │   ├── active/        # 当前活跃合约
│   │   └── archive/       # 已完成合约
│   ├── specializations/   # 子代理角色定义
│   └── workflows/         # 多代理工作流 DAG
├── entropy/               # Layer 4: 熵管理（定期清理）
│   ├── drift-detector.sh
│   ├── doc-consistency.sh
│   ├── dependency-audit.sh
│   └── schedule.json
└── metrics/               # Layer 5: 度量与可观测
    ├── session-logger.sh
    ├── session-log.jsonl
    └── weekly-report.sh
```

## 执行清单

按阶段渐进实施。每阶段独立交付价值，可随时停止。

### Phase 0: Foundation（10-30 分钟）

- [ ] **P0.1** 评估项目现状：现有 CLAUDE.md/AGENTS.md、CI/CD、测试、pre-commit 等
- [ ] **P0.2** 创建 `.harness/` 目录骨架（使用 `templates/scaffold.sh`）
- [ ] **P0.3** 创建 `.harness/README.md`（使用 `templates/harness-readme.md`）
- [ ] **P0.4** 创建 `.harness/VERSION`，初始版本 `0.1.0`
- [ ] **P0.5** 在项目导航文件（CLAUDE.md/AGENTS.md/CODEX.md）中添加 `.harness/` 引用
- [ ] **P0.6** 在 `.gitignore` 中排除 `*.jsonl`（日志文件不入库）
- [ ] **验证**: `.harness/` 目录存在且有 README；现有所有 Agent 配置正常工作

### Phase 1: Feedback Loops（核心价值，1-4 小时）

#### 1A: Pre-commit Hooks

- [ ] **P1.1** 安装 husky + lint-staged（参考 `templates/pre-commit-setup.sh`）
- [ ] **P1.2** 配置 lint-staged（按子模块/目录分治）
- [ ] **P1.3** 添加 commit-msg hook（验证 `<type>(scope): <摘要>` 格式）
- [ ] **验证**: `git commit` 时自动运行 lint + format；不合规 commit message 被拒绝

#### 1B: 架构漂移检测

- [ ] **P1.4** 定义漂移规则 `rules.json`（使用 `templates/drift-rules.json`）
- [ ] **P1.5** 编写分层检查脚本（使用 `templates/check-layers.sh`）
- [ ] **P1.6** 编写命名约定检查脚本（根据项目定制）
- [ ] **P1.7** 创建 `run-all.sh` 统一入口
- [ ] **验证**: 架构违规被报告

#### 1C: CI 增强

- [ ] **P1.8** 在 CI 中添加 lint stage
- [ ] **P1.9** 在 CI 中添加架构漂移检测（初期 `allow_failure: true`）
- [ ] **验证**: CI pipeline 包含 lint + drift 检测阶段

### Phase 2: Context Refactor（2-4 小时）

- [ ] **P2.1** 分析当前 AGENTS.md/CLAUDE.md 内容，识别领域模块
- [ ] **P2.2** 将领域知识拆分到 `.harness/context/<domain>.md`
- [ ] **P2.3** 精简导航文件（CLAUDE.md ≤ 50 行，AGENTS.md ≤ 80 行）
- [ ] **P2.4** 添加 `.harness/context/README.md` 索引
- [ ] **P2.5** 更新现有 Skills/Agents 中的引用路径
- [ ] **验证**: 导航文件简洁；领域知识可按需获取；现有工作流不中断

### Phase 3: Agent Orchestration（1-2 天）

- [ ] **P3.1** 创建 Sprint Contract 模板（使用 `templates/sprint-contract.json`）
- [ ] **P3.2** 创建 `active/` 和 `archive/` 目录
- [ ] **P3.3** 用一个实际任务验证 Contract 流程
- [ ] **P3.4** 定义多代理工作流 DAG（feature-development、bug-fix）
- [ ] **P3.5**（可选）创建专项子代理：harness-evaluator、entropy-cleaner
- [ ] **验证**: 能通过 Sprint Contract 定义、执行、评估一个完整功能

### Phase 4: Entropy & Metrics（1 天）

- [ ] **P4.1** 编写 drift-detector.sh（综合架构漂移检测）
- [ ] **P4.2** 编写 doc-consistency.sh（文档与代码一致性检查）
- [ ] **P4.3** 编写 dependency-audit.sh（依赖审计）
- [ ] **P4.4** 创建 schedule.json（调度配置）
- [ ] **P4.5** 编写 session-logger.sh（会话日志记录）
- [ ] **P4.6** 编写 weekly-report.sh（周报生成）
- [ ] **验证**: 所有脚本可独立运行；会话日志可追加；周报可自动生成

### Phase 5: Continuous Evolution（持续）

- [ ] **P5.1** 每次 Agent 犯错 → 更新对应 Guide 或 Sensor
- [ ] **P5.2** 每周回顾 drift 报告，调整规则严格度
- [ ] **P5.3** 每月审查 Harness 组件，移除不再需要的复杂度
- [ ] **P5.4** 模型升级时，重新评估各 Harness 组件是否仍然必要

## 上下文架构设计指南

### 三层上下文系统

| 层级 | 内容 | 加载方式 |
|------|------|----------|
| Tier 1: Hot Memory | CLAUDE.md/AGENTS.md — 项目概览、导航、核心约束 | 自动加载 |
| Tier 2: Domain Expert | .harness/context/ — 按需加载的领域知识 | 按需加载 |
| Tier 3: Cold Memory | 研究文档、规格说明、历史存档 | 检索触发 |

### 导航文件设计原则

- CLAUDE.md 回答 "where do I look?"，不是 "what do I know?"
- 保持简洁（理想 <60 行）— 它是导航文档，不是知识库
- 渐进式披露 (Progressive Disclosure) 防止上下文污染
- 上下文窗口利用率保持在 40-60%

### 领域模块结构

每个 `.harness/context/<domain>.md` 使用以下结构：

```markdown
---
domain: <domain-name>
updated: <date>
triggers: ["关键词1", "关键词2", ...]
---

# <领域名称>开发上下文

## 架构约束
（该领域的硬性规则）

## 关键模式
（常用代码模式与约定）

## 常见陷阱
（Agent 容易犯的错误与纠正方式）
```

## 控制系统分类

### 前馈控制 (Guides)
- 在执行前预见 Agent 行为
- 例: 架构文档、编码指南、Skills、引导脚本

### 反馈控制 (Sensors)
- 观察执行后结果
- 例: linter、测试、类型检查、架构漂移检测

### 两种验证类型

| 类型 | 方式 | 速度 | 可靠性 | 成本 |
|------|------|------|--------|------|
| 计算型 (Computational) | 测试、Linter、类型检查 | 毫秒-秒 | 确定性 | 最小 |
| 推理型 (Inferential) | AI 审查、语义判断 | 秒-分钟 | 非确定性 | 显著 |

**优先使用计算型控制**——它快速、可靠、低成本。推理型仅在计算型无法覆盖时使用。

## Sprint Contract 机制

Sprint Contract 是多代理协调的核心机制。在实现前，各参与 Agent 协商合约：

```json
{
  "id": "sprint-<date>-<seq>",
  "objective": "一句话描述目标",
  "scope": {
    "modules": ["允许修改的路径"],
    "read_only": ["只读路径"],
    "forbidden": ["禁止接触的路径"]
  },
  "success_criteria": [
    { "id": "SC-1", "description": "...", "verification": "..." }
  ],
  "constraints": ["约束1", "约束2"],
  "agents": {
    "generator": { "model": "...", "context": "..." },
    "evaluator": { "model": "...", "context": "..." }
  }
}
```

完整模板见 `templates/sprint-contract.json`。

## 关键指标

| 指标 | 说明 | 目标 |
|------|------|------|
| Agent PR 吞吐量 | PR/day/engineer | ≥ 2.0 |
| 首次通过率 | Agent 产出无需人工修正的比例 | ≥ 60% |
| 迭代次数 | 平均几轮达到验收标准 | ≤ 3 |
| 上下文效率 | 有效上下文占比 | ≥ 50% |
| 漂移指数 | 架构违规数趋势 | 持续下降 |

## 实施层级参考

| 层级 | 范围 | 内容 | 投入 |
|------|------|------|------|
| Level 1 | 个人 | CLAUDE.md + pre-commit hooks + 测试 | 1-2 小时 |
| Level 2 | 团队 | + AGENTS.md + CI 约束 + 共享模板 | 1-2 天 |
| Level 3 | 组织 | + 自定义中间件 + 可观测性 + Harness 版本管理 | 1-2 周 |

## 反模式

- 在遇到真实失败前预设计理想配置
- 安装"以防万一"的工具
- 将 Harness 视为静态不变
- 模糊的文档
- 将关键知识存储在仓库外
- 过度工程化控制流

## 模板文件

| 文件 | 用途 | 何时使用 |
|------|------|---------|
| `templates/scaffold.sh` | 创建 .harness/ 目录骨架 | Phase 0 |
| `templates/harness-readme.md` | .harness/README.md 模板 | Phase 0 |
| `templates/drift-rules.json` | 架构漂移规则定义 | Phase 1B |
| `templates/check-layers.sh` | 模块分层检查脚本 | Phase 1B |
| `templates/pre-commit-setup.sh` | husky + lint-staged 安装脚本 | Phase 1A |
| `templates/sprint-contract.json` | Sprint Contract 模板 | Phase 3 |
| `templates/session-log-format.jsonl` | 会话日志格式示例 | Phase 4 |
| `templates/schedule.json` | 熵管理调度配置 | Phase 4 |

## 参考文献

详见 `references/sources.md`。核心来源：

- [OpenAI: Harness Engineering](https://openai.com/index/harness-engineering/)
- [Anthropic: Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)
- [Fowler/Thoughtworks: Harness Engineering](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html)
- [HumanLayer: Skill Issue](https://www.humanlayer.dev/blog/skill-issue-harness-engineering-for-coding-agents)

## 不适用场景

- 单次脚本或一次性任务——不需要 Harness
- 纯人工开发项目——Harness 专为 AI Agent 协作设计
- 模型选择与 prompt engineering——Harness 工程关注模型以外的一切

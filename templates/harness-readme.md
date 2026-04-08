# Harness Engineering — {{PROJECT_NAME}}

> 约束、告知、验证、纠正 AI Agent 行为的系统工程。

## 目录结构

```
.harness/
├── context/       # Layer 1: 领域上下文（按需加载）
├── sensors/       # Layer 2: 反馈传感器
│   ├── pre-commit/  # 快速检查: lint + format + type-check
│   ├── ci/          # CI pipeline sensors
│   ├── drift/       # 架构漂移检测
│   └── eval/        # Agent 输出评估
├── agents/        # Layer 3: 多代理编排
│   ├── contracts/   # Sprint Contracts
│   ├── specializations/  # 子代理角色定义
│   └── workflows/   # 多代理工作流 DAG
├── entropy/       # Layer 4: 熵管理（定期清理）
└── metrics/       # Layer 5: 度量与可观测
```

## 设计原则

1. **可拆卸**: 每个组件独立，模型改进后可安全移除
2. **渐进式**: 从失败中学习，只在遇到问题时添加配置
3. **仓库即真相**: 所有配置版本控制
4. **反馈优先**: 成功静默，失败详报

## 与现有系统关系

- 增量层: 不破坏现有 Agent 配置（.claude/ / .agent/ / .opencode/ 等）
- 导航文件（CLAUDE.md/AGENTS.md）引用 .harness/ 路径
- 子模块可选继承 workspace 级 Harness

## 版本

见 `VERSION` 文件。

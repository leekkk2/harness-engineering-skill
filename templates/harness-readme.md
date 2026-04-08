# Harness Engineering — {{PROJECT_NAME}}

> Systems that constrain, inform, verify, and correct AI agent behavior.

## Directory Structure

```
.harness/
├── context/       # Layer 1: Domain context (loaded on demand)
├── sensors/       # Layer 2: Feedback sensors
│   ├── pre-commit/  # Fast checks: lint + format + type-check
│   ├── ci/          # CI pipeline sensors
│   ├── drift/       # Architecture drift detection
│   └── eval/        # Agent output evaluation
├── agents/        # Layer 3: Multi-agent orchestration
│   ├── contracts/   # Sprint Contracts
│   ├── specializations/  # Sub-agent role definitions
│   └── workflows/   # Multi-agent workflow DAGs
├── entropy/       # Layer 4: Entropy management (periodic cleanup)
└── metrics/       # Layer 5: Metrics & observability
```

## Design Principles

1. **Rippable**: Each component works independently; safely remove when models improve
2. **Incremental**: Learn from failures; add configuration only when problems emerge
3. **Repo as Truth**: All configuration is version-controlled
4. **Feedback First**: Success is silent; failures are verbose

## Relationship with Existing Systems

- Additive layer: does not break existing agent configuration (.claude/ / .agent/ / .opencode/ etc.)
- Navigation files (CLAUDE.md/AGENTS.md) reference .harness/ paths
- Submodules can optionally inherit workspace-level harness

## Version

See `VERSION` file.

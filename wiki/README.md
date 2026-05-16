# harness-engineering-skill — Wiki

## 仓库使命

一个可复用的 AI agent skill，用于在任意项目中系统性地落地 Harness Engineering：通过 5 层 `.harness/` 目录、pre-commit hooks、架构漂移检测、Sprint Contract 多 agent 协作、熵管理与 metrics，把 agent 行为「约束 / 告知 / 验证 / 纠正」。

口号：`Agent = Model + Harness`。LangChain 在 SWE-bench 上仅通过修改 harness 即从 52.8% → 66.5%（Top 30 → Top 5），印证了该范式的价值。

## 主要入口

| 路径 | 角色 |
|---|---|
| `SKILL.md` | Skill 核心定义（agent 读取入口） |
| `README.md` | 使用者文档（如何安装到 Claude Code / 其他平台） |
| `templates/scaffold.sh` | `.harness/` 目录脚手架脚本 |
| `templates/harness-readme.md` | `.harness/README.md` 模板 |
| `templates/drift-rules.json` + `check-layers.sh` | 架构漂移规则与校验脚本 |
| `templates/sprint-contract.json` | Sprint Contract 多 agent 协作模板 |
| `templates/pre-commit-setup.sh` | husky + lint-staged 安装器 |
| `templates/session-log-format.jsonl` | 会话日志格式 |
| `templates/schedule.json` | 熵管理周期任务 |
| `references/` | 权威来源与背景资料 |

## 当前 git 状态

- 分支：`main`（tracking `github/main`）
- 最近 commit：`e071930 chore(git): 为 Playwright 产物添加 .gitignore 屏蔽规则`
- 备注：本仓库通常以 git submodule 形式嵌入下游项目的 `.claude/skills/` 或 `~/.claude/skills/`

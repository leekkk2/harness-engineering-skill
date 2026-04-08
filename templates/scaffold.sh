#!/bin/bash
# scaffold.sh — 创建 .harness/ 目录骨架
# 用法: bash templates/scaffold.sh [project-root]
# 默认在当前目录创建

set -euo pipefail

PROJECT_ROOT="${1:-.}"

echo ">>> 在 ${PROJECT_ROOT} 创建 .harness/ 骨架..."

# Layer 0: 根目录
mkdir -p "${PROJECT_ROOT}/.harness"

# Layer 1: 领域上下文
mkdir -p "${PROJECT_ROOT}/.harness/context"

# Layer 2: 反馈传感器
mkdir -p "${PROJECT_ROOT}/.harness/sensors/pre-commit/hooks"
mkdir -p "${PROJECT_ROOT}/.harness/sensors/ci"
mkdir -p "${PROJECT_ROOT}/.harness/sensors/drift"
mkdir -p "${PROJECT_ROOT}/.harness/sensors/eval/criteria"

# Layer 3: 多代理编排
mkdir -p "${PROJECT_ROOT}/.harness/agents/contracts/active"
mkdir -p "${PROJECT_ROOT}/.harness/agents/contracts/archive"
mkdir -p "${PROJECT_ROOT}/.harness/agents/specializations"
mkdir -p "${PROJECT_ROOT}/.harness/agents/workflows"

# Layer 4: 熵管理
mkdir -p "${PROJECT_ROOT}/.harness/entropy"

# Layer 5: 度量
mkdir -p "${PROJECT_ROOT}/.harness/metrics/templates"

# 创建 VERSION 文件
echo "0.1.0" > "${PROJECT_ROOT}/.harness/VERSION"

# 确保 .gitignore 排除日志文件
if [ -f "${PROJECT_ROOT}/.gitignore" ]; then
    if ! grep -q '\.harness/metrics/.*\.jsonl' "${PROJECT_ROOT}/.gitignore" 2>/dev/null; then
        echo "" >> "${PROJECT_ROOT}/.gitignore"
        echo "# Harness 日志文件（不入库）" >> "${PROJECT_ROOT}/.gitignore"
        echo ".harness/metrics/*.jsonl" >> "${PROJECT_ROOT}/.gitignore"
    fi
else
    cat > "${PROJECT_ROOT}/.gitignore" << 'GITIGNORE'
# Harness 日志文件（不入库）
.harness/metrics/*.jsonl
GITIGNORE
fi

echo ">>> .harness/ 骨架创建完成"
echo ""
echo "下一步:"
echo "  1. 复制 harness-readme.md 到 .harness/README.md 并按项目定制"
echo "  2. 在项目 CLAUDE.md/AGENTS.md 中添加 .harness/ 引用"
echo "  3. 开始 Phase 1: Feedback Loops"

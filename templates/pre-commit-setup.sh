#!/bin/bash
# pre-commit-setup.sh — 安装 husky + lint-staged
# 用法: bash pre-commit-setup.sh [project-root]
#
# 支持 monorepo 和单项目两种模式。
# 脚本会检测项目类型并生成对应配置。

set -euo pipefail

PROJECT_ROOT="${1:-.}"

echo "=== Pre-commit Hooks 安装 ==="
echo "项目根目录: $PROJECT_ROOT"
echo ""

# 检测包管理器
if [ -f "$PROJECT_ROOT/pnpm-lock.yaml" ]; then
    PM="pnpm"
elif [ -f "$PROJECT_ROOT/yarn.lock" ]; then
    PM="yarn"
else
    PM="npm"
fi

echo "检测到包管理器: $PM"

# 检测是否有 package.json
if [ ! -f "$PROJECT_ROOT/package.json" ]; then
    echo "错误: 未找到 package.json，请先初始化 Node.js 项目"
    exit 1
fi

# 安装 husky + lint-staged
echo ""
echo ">>> 安装 husky + lint-staged..."
cd "$PROJECT_ROOT"
$PM install -D husky lint-staged 2>&1 || {
    echo "错误: 安装失败"
    exit 1
}

# 初始化 husky
echo ""
echo ">>> 初始化 husky..."
npx husky init 2>&1 || {
    echo "错误: husky 初始化失败"
    exit 1
}

# 创建 pre-commit hook
echo ""
echo ">>> 配置 pre-commit hook..."
cat > .husky/pre-commit << 'HOOK'
npx lint-staged
HOOK

# 创建 commit-msg hook（中文 commit message 格式校验）
echo ""
echo ">>> 配置 commit-msg hook..."
cat > .husky/commit-msg << 'HOOK'
#!/bin/sh
MSG=$(cat "$1")
# 校验格式: <type>(scope): <摘要> 或 <type>: <摘要>
if ! echo "$MSG" | head -1 | grep -qE '^(feat|fix|refactor|docs|test|chore|style|perf|ci|build|revert)(\(.+\))?: .+'; then
    echo ""
    echo "错误: Commit message 格式不正确"
    echo "正确格式: <type>(scope): <摘要>"
    echo "  type: feat|fix|refactor|docs|test|chore|style|perf|ci|build|revert"
    echo "  scope: 可选"
    echo "  摘要: 动词开头，不加句号"
    echo ""
    echo "示例:"
    echo "  feat(auth): 添加 JWT 刷新机制"
    echo "  fix: 修复用户列表分页问题"
    echo ""
    exit 1
fi
HOOK
chmod +x .husky/commit-msg

# 生成 lint-staged 配置
echo ""
echo ">>> 生成 lint-staged 配置..."

# 检测项目中的子目录结构
HAS_TS=$(find "$PROJECT_ROOT" -name "*.ts" -not -path "*/node_modules/*" -not -path "*/.git/*" | head -1)
HAS_TSX=$(find "$PROJECT_ROOT" -name "*.tsx" -not -path "*/node_modules/*" -not -path "*/.git/*" | head -1)

cat > .lintstagedrc.json << 'CONFIG'
{
  "*.{ts,tsx,js,jsx}": ["eslint --fix", "prettier --write"],
  "*.{json,md,yml,yaml}": ["prettier --write"]
}
CONFIG

echo ""
echo "=== 安装完成 ==="
echo ""
echo "已创建:"
echo "  .husky/pre-commit    — lint-staged 触发"
echo "  .husky/commit-msg    — commit message 格式校验"
echo "  .lintstagedrc.json   — lint-staged 规则"
echo ""
echo "请确保项目中已安装 eslint 和 prettier:"
echo "  $PM install -D eslint prettier"
echo ""
echo "测试: 执行 git commit 验证 hooks 是否生效"

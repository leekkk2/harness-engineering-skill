#!/bin/bash
# pre-commit-setup.sh — Install husky + lint-staged
# Usage: bash pre-commit-setup.sh [project-root]
#
# Supports both monorepo and single-project setups.
# Detects project type and generates appropriate configuration.

set -euo pipefail

PROJECT_ROOT="${1:-.}"

echo "=== Pre-commit Hooks Setup ==="
echo "Project root: $PROJECT_ROOT"
echo ""

# Detect package manager
if [ -f "$PROJECT_ROOT/pnpm-lock.yaml" ]; then
    PM="pnpm"
elif [ -f "$PROJECT_ROOT/yarn.lock" ]; then
    PM="yarn"
else
    PM="npm"
fi

echo "Detected package manager: $PM"

# Check for package.json
if [ ! -f "$PROJECT_ROOT/package.json" ]; then
    echo "Error: package.json not found. Please initialize a Node.js project first."
    exit 1
fi

# Install husky + lint-staged
echo ""
echo ">>> Installing husky + lint-staged..."
cd "$PROJECT_ROOT"
$PM install -D husky lint-staged 2>&1 || {
    echo "Error: Installation failed"
    exit 1
}

# Initialize husky
echo ""
echo ">>> Initializing husky..."
npx husky init 2>&1 || {
    echo "Error: husky initialization failed"
    exit 1
}

# Create pre-commit hook
echo ""
echo ">>> Configuring pre-commit hook..."
cat > .husky/pre-commit << 'HOOK'
npx lint-staged
HOOK

# Create commit-msg hook (conventional commit format validation)
echo ""
echo ">>> Configuring commit-msg hook..."
cat > .husky/commit-msg << 'HOOK'
#!/bin/sh
MSG=$(cat "$1")
# Validate format: <type>(scope): <summary> or <type>: <summary>
if ! echo "$MSG" | head -1 | grep -qE '^(feat|fix|refactor|docs|test|chore|style|perf|ci|build|revert)(\(.+\))?: .+'; then
    echo ""
    echo "Error: Invalid commit message format"
    echo "Expected: <type>(scope): <summary>"
    echo "  type: feat|fix|refactor|docs|test|chore|style|perf|ci|build|revert"
    echo "  scope: optional"
    echo "  summary: start with a verb, no trailing period"
    echo ""
    echo "Examples:"
    echo "  feat(auth): add JWT refresh mechanism"
    echo "  fix: resolve user list pagination issue"
    echo ""
    exit 1
fi
HOOK
chmod +x .husky/commit-msg

# Generate lint-staged configuration
echo ""
echo ">>> Generating lint-staged configuration..."

cat > .lintstagedrc.json << 'CONFIG'
{
  "*.{ts,tsx,js,jsx}": ["eslint --fix", "prettier --write"],
  "*.{json,md,yml,yaml}": ["prettier --write"]
}
CONFIG

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Created:"
echo "  .husky/pre-commit    — lint-staged trigger"
echo "  .husky/commit-msg    — commit message format validation"
echo "  .lintstagedrc.json   — lint-staged rules"
echo ""
echo "Make sure eslint and prettier are installed in your project:"
echo "  $PM install -D eslint prettier"
echo ""
echo "Test: run git commit to verify hooks are working"

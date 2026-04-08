#!/bin/bash
# scaffold.sh — Create .harness/ directory scaffold
# Usage: bash templates/scaffold.sh [project-root]
# Defaults to current directory if not specified

set -euo pipefail

PROJECT_ROOT="${1:-.}"

echo ">>> Creating .harness/ scaffold in ${PROJECT_ROOT}..."

# Layer 0: Root
mkdir -p "${PROJECT_ROOT}/.harness"

# Layer 1: Domain context
mkdir -p "${PROJECT_ROOT}/.harness/context"

# Layer 2: Feedback sensors
mkdir -p "${PROJECT_ROOT}/.harness/sensors/pre-commit/hooks"
mkdir -p "${PROJECT_ROOT}/.harness/sensors/ci"
mkdir -p "${PROJECT_ROOT}/.harness/sensors/drift"
mkdir -p "${PROJECT_ROOT}/.harness/sensors/eval/criteria"

# Layer 3: Multi-agent orchestration
mkdir -p "${PROJECT_ROOT}/.harness/agents/contracts/active"
mkdir -p "${PROJECT_ROOT}/.harness/agents/contracts/archive"
mkdir -p "${PROJECT_ROOT}/.harness/agents/specializations"
mkdir -p "${PROJECT_ROOT}/.harness/agents/workflows"

# Layer 4: Entropy management
mkdir -p "${PROJECT_ROOT}/.harness/entropy"

# Layer 5: Metrics
mkdir -p "${PROJECT_ROOT}/.harness/metrics/templates"

# Create VERSION file
echo "0.1.0" > "${PROJECT_ROOT}/.harness/VERSION"

# Ensure .gitignore excludes log files
if [ -f "${PROJECT_ROOT}/.gitignore" ]; then
    if ! grep -q '\.harness/metrics/.*\.jsonl' "${PROJECT_ROOT}/.gitignore" 2>/dev/null; then
        echo "" >> "${PROJECT_ROOT}/.gitignore"
        echo "# Harness log files (not committed)" >> "${PROJECT_ROOT}/.gitignore"
        echo ".harness/metrics/*.jsonl" >> "${PROJECT_ROOT}/.gitignore"
    fi
else
    cat > "${PROJECT_ROOT}/.gitignore" << 'GITIGNORE'
# Harness log files (not committed)
.harness/metrics/*.jsonl
GITIGNORE
fi

echo ">>> .harness/ scaffold created successfully"
echo ""
echo "Next steps:"
echo "  1. Copy harness-readme.md to .harness/README.md and customize for your project"
echo "  2. Add .harness/ references in your CLAUDE.md/AGENTS.md"
echo "  3. Start Phase 1: Feedback Loops"

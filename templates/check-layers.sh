#!/bin/bash
# check-layers.sh — Check module layer violations
# Usage: bash check-layers.sh <src-dir> [rules.json]
#
# Scans import/require statements based on layer rules defined in rules.json,
# detecting cross-layer violation references.

set -euo pipefail

SRC_DIR="${1:?Usage: check-layers.sh <src-dir> [rules.json]}"
RULES_FILE="${2:-.harness/sensors/drift/rules.json}"

if [ ! -d "$SRC_DIR" ]; then
    echo "Error: source directory does not exist: $SRC_DIR"
    exit 1
fi

if [ ! -f "$RULES_FILE" ]; then
    echo "Warning: rules file not found: $RULES_FILE, skipping layer check"
    exit 0
fi

VIOLATIONS=0

echo "=== Architecture Layer Check ==="
echo "Source directory: $SRC_DIR"
echo "Rules file: $RULES_FILE"
echo ""

# Extract layer configurations and check violations using python3 (cross-platform)
python3 -c "
import json, os, re, sys

with open('$RULES_FILE') as f:
    rules = json.load(f)

layers = rules.get('layers', {})
violations = 0

for layer_name, layer_config in layers.items():
    cannot_import = layer_config.get('cannot_import', [])
    if not cannot_import:
        continue

    # Find files belonging to this layer
    for root, dirs, files in os.walk('$SRC_DIR'):
        for fname in files:
            if not fname.endswith(('.ts', '.tsx', '.js', '.jsx')):
                continue

            filepath = os.path.join(root, fname)
            rel_path = os.path.relpath(filepath, '$SRC_DIR')

            # Determine if file belongs to the current layer
            if '/' + layer_name + '/' not in '/' + rel_path and \
               not rel_path.startswith(layer_name + '/') and \
               layer_name + '.' not in fname:
                continue

            with open(filepath, 'r', errors='ignore') as fh:
                for line_num, line in enumerate(fh, 1):
                    for forbidden in cannot_import:
                        # Check if import/require references a forbidden layer
                        pattern = r\"(import\s.*from\s+['\"].*\" + forbidden + r\".*['\"]|require\s*\(['\"].*\" + forbidden + r\".*['\"]\))\"
                        if re.search(pattern, line):
                            print(f'  Violation: {rel_path}:{line_num}')
                            print(f'    {layer_name} layer must not import from {forbidden} layer')
                            print(f'    {line.strip()}')
                            print()
                            violations += 1

sys.exit(1 if violations > 0 else 0)
" 2>&1

EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    echo "Passed: no layer violations found"
else
    echo "Failed: layer violations detected, please fix and re-check"
fi

exit $EXIT_CODE

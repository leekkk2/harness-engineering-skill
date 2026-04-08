#!/bin/bash
# check-layers.sh — 检查模块分层是否违规
# 用法: bash check-layers.sh <src-dir> [rules.json]
#
# 基于 rules.json 中定义的分层规则，扫描 import/require 语句，
# 检测是否存在跨层违规引用。

set -euo pipefail

SRC_DIR="${1:?用法: check-layers.sh <src-dir> [rules.json]}"
RULES_FILE="${2:-.harness/sensors/drift/rules.json}"

if [ ! -d "$SRC_DIR" ]; then
    echo "错误: 源目录不存在: $SRC_DIR"
    exit 1
fi

if [ ! -f "$RULES_FILE" ]; then
    echo "警告: 规则文件不存在: $RULES_FILE，跳过分层检查"
    exit 0
fi

VIOLATIONS=0

echo "=== 架构分层检查 ==="
echo "源目录: $SRC_DIR"
echo "规则文件: $RULES_FILE"
echo ""

# 提取 layers 配置中的 cannot_import 规则
# 使用 python3 解析 JSON（跨平台兼容）
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

    # 查找属于该层的文件
    for root, dirs, files in os.walk('$SRC_DIR'):
        for fname in files:
            if not fname.endswith(('.ts', '.tsx', '.js', '.jsx')):
                continue

            filepath = os.path.join(root, fname)
            rel_path = os.path.relpath(filepath, '$SRC_DIR')

            # 判断文件是否属于当前检查的层
            if '/' + layer_name + '/' not in '/' + rel_path and \
               not rel_path.startswith(layer_name + '/') and \
               layer_name + '.' not in fname:
                continue

            with open(filepath, 'r', errors='ignore') as fh:
                for line_num, line in enumerate(fh, 1):
                    for forbidden in cannot_import:
                        # 检查 import/require 语句中是否引用了禁止的层
                        pattern = r\"(import\s.*from\s+['\"].*\" + forbidden + r\".*['\"]|require\s*\(['\"].*\" + forbidden + r\".*['\"]\))\"
                        if re.search(pattern, line):
                            print(f'  违规: {rel_path}:{line_num}')
                            print(f'    {layer_name} 层不应引用 {forbidden} 层')
                            print(f'    {line.strip()}')
                            print()
                            violations += 1

sys.exit(1 if violations > 0 else 0)
" 2>&1

EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    echo "通过: 未发现分层违规"
else
    echo "失败: 发现分层违规，请修复后重新检查"
fi

exit $EXIT_CODE

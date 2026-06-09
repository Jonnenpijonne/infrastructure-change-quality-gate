#!/usr/bin/env bash
set -u

mkdir -p reports

REPORT="${REPORT_PATH:-reports/gatehouse-audit-evidence-report.md}"
VALIDATOR="${VALIDATOR_PATH:-validation/pre-merge-checks/validate-change-request.py}"

if [ "$#" -gt 0 ]; then
  FILES="$*"
elif [ -f "examples/rbac-lite-partner-access-change.md" ]; then
  FILES="examples/rbac-lite-partner-access-change.md"
elif [ -f "examples/valid/muutospyynto-hyvaksytty.md" ]; then
  FILES="examples/valid/muutospyynto-hyvaksytty.md"
elif [ -f "examples/example-change-request.md" ]; then
  FILES="examples/example-change-request.md"
else
  FILES=$(find examples -name "*.md" -type f 2>/dev/null | tr '\n' ' ')
fi

if [ -z "${FILES:-}" ]; then
  echo "ERROR: No validation files found."
  exit 1
fi

FAILED=0
GENERATED_AT="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

{
  echo "# Gatehouse Audit Evidence Report"
  echo
  echo "| Field | Value |"
  echo "|---|---|"
  echo "| Repository | \`${GITHUB_REPOSITORY:-local}\` |"
  echo "| Branch | \`${GITHUB_REF_NAME:-local}\` |"
  echo "| Commit | \`${GITHUB_SHA:-local}\` |"
  echo "| Run | \`${GITHUB_RUN_NUMBER:-local}\` |"
  echo "| Trigger | \`${GITHUB_EVENT_NAME:-local}\` |"
  echo "| Validator | \`$VALIDATOR\` |"
  echo "| Generated | \`$GENERATED_AT\` |"
  echo "| Report path | \`$REPORT\` |"
  echo
  echo "## ISO / Governance Control Mapping"
  echo
  echo "- A.5.15 Access control"
  echo "- A.8.3 Information access restriction"
  echo "- A.8.30 Outsourced development"
  echo "- A.8.32 Change management"
  echo "- A.8.28 Secure coding"
  echo
  echo "## Validation Files"
  for FILE in $FILES; do
    echo "- \`$FILE\`"
  done
  echo
  echo "## Validation Results"
  echo
} > "$REPORT"

for FILE in $FILES; do
  echo "Validating: $FILE"

  {
    echo "### File: \`$FILE\`"
    echo
    echo '```text'
  } >> "$REPORT"

  python3 "$VALIDATOR" "$FILE" >> "$REPORT" 2>&1
  STATUS=$?

  {
    echo '```'
    echo
  } >> "$REPORT"

  if [ "$STATUS" -ne 0 ]; then
    FAILED=1
  fi
done

{
  echo "## Final Status"
  echo
  if [ "$FAILED" -eq 1 ]; then
    echo "❌ **QUALITY GATE: FAILED**"
  else
    echo "✅ **QUALITY GATE: PASSED**"
  fi
  echo
  echo "Generated report:"
  echo
  echo "\`$REPORT\`"
} >> "$REPORT"

echo "Report generated: $REPORT"

if [ "$FAILED" -eq 1 ]; then
  exit 1
fi

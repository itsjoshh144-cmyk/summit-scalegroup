#!/usr/bin/env bash
# Saves the demo receptionist as a permanent assistant in your Vapi account and prints its ID.
# Usage: VAPI_PRIVATE_KEY=your-private-key ./demo/create-assistant.sh
set -euo pipefail
: "${VAPI_PRIVATE_KEY:?Set VAPI_PRIVATE_KEY (Vapi dashboard > API Keys > Private key)}"
cd "$(dirname "$0")"
curl -sS -X POST https://api.vapi.ai/assistant \
  -H "Authorization: Bearer ${VAPI_PRIVATE_KEY}" \
  -H "Content-Type: application/json" \
  --data @brighton-boiler-assistant.json \
  | python3 -c 'import json,sys; r=json.load(sys.stdin); print(r["id"] if "id" in r else json.dumps(r, indent=2))'

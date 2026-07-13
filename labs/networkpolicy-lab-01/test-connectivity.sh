#!/usr/bin/env bash
set -u

LAB_NS="networkpolicy-lab-01"
TRUSTED_NS="trusted-client"
UNTRUSTED_NS="untrusted-client"
WEB_URL="http://web-service.${LAB_NS}.svc.cluster.local"
API_URL="http://api-service.${LAB_NS}.svc.cluster.local"

pod_name() {
  kubectl get pod -n "$1" -l "$2" -o jsonpath='{.items[0].metadata.name}'
}

run_test() {
  local title="$1"
  local namespace="$2"
  local pod="$3"
  local url="$4"

  echo
  echo "=== ${title} ==="
  if kubectl exec -n "$namespace" "$pod" -- \
      wget -qO- -T 3 "$url" 2>/dev/null; then
    echo
    echo "RESULT: ALLOWED"
  else
    echo "RESULT: BLOCKED"
  fi
}

same_allowed="$(pod_name "$LAB_NS" 'app=client,access=web')"
same_blocked="$(pod_name "$LAB_NS" 'app=client,access=blocked')"
trusted="$(pod_name "$TRUSTED_NS" 'app=client,access=web')"
untrusted="$(pod_name "$UNTRUSTED_NS" 'app=client,access=web')"

run_test "Same Namespace approved client to web" "$LAB_NS" "$same_allowed" "$WEB_URL"
run_test "Same Namespace blocked client to web" "$LAB_NS" "$same_blocked" "$WEB_URL"
run_test "Trusted Namespace client to web" "$TRUSTED_NS" "$trusted" "$WEB_URL"
run_test "Untrusted Namespace client to web" "$UNTRUSTED_NS" "$untrusted" "$WEB_URL"
run_test "Approved client to API" "$LAB_NS" "$same_allowed" "$API_URL"

echo
echo "=== Approved client DNS lookup ==="
if kubectl exec -n "$LAB_NS" "$same_allowed" -- \
    nslookup "web-service.${LAB_NS}.svc.cluster.local" >/dev/null 2>&1; then
  echo "RESULT: ALLOWED"
else
  echo "RESULT: BLOCKED"
fi

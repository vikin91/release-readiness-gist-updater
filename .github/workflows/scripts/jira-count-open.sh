#!/usr/bin/env bash
set -euo pipefail

RELEASE="$2"
PATCH="$3"

main(){
  # TODO: Jira returns 400 if requested fixVersion does not exist. That means
  # the named release must exist on Jira, which is not given.
  JQL="project IN (ROX) \
  AND fixVersion IN (\"$RELEASE.$PATCH\") \
  AND status != CLOSED \
  AND Component != Documentation \
  AND type != Epic \
  ORDER BY assignee"
  curl --fail -sSL --get --data-urlencode "jql=$JQL" \
        -H "Authorization: Bearer $JIRA_TOKEN" \
        -H "Accept: application/json" \
        "https://issues.redhat.com/rest/api/2/search" |\
    jq -r '.issues[] | .key' | sort | awk 'END{print NR}'

}

main "${@}"

#!/usr/bin/env bash
set -e

BUILD_REASON="${BUILD_REASON:-local}"
BRANCH="${BRANCH:-$(git rev-parse --abbrev-ref HEAD)}"

echo "Build reason: ${BUILD_REASON}"
echo "Source branch: ${BRANCH}"

CHANGED_DERIVED=$(git diff --name-status -- strimzi amq-streams debezium metrics open-data-hub)
GENERATED_FILES=$(git ls-files --other --exclude-standard -- strimzi amq-streams debezium metrics open-data-hub)
if [ -n "$CHANGED_DERIVED" ] || [ -n "$GENERATED_FILES" ] ; then
    if [ -n "$CHANGED_DERIVED" ] ; then
        echo "ERROR: Uncommitted changes in derived resources:"
        echo "$CHANGED_DERIVED"
    fi
  
    if [ -n "$GENERATED_FILES" ] ; then
        echo "ERROR: Uncommitted changes in generated resources:"
        echo "$GENERATED_FILES"
    fi
  
    echo "Run the following to add up-to-date resources:"
    echo "  make \\"
    echo "    && git add strimzi amq-streams debezium metrics open-data-hub \\"
    echo "    && git commit -s -m 'Update derived resources'"
    exit 1
fi

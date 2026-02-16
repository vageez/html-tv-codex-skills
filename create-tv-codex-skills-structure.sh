#!/usr/bin/env bash

set -euo pipefail

BASE_DIR="${1:-$PWD}"
REPO_ROOT="$BASE_DIR/html-tv-codex-skills"
SKILLS_ROOT="$REPO_ROOT/skills"

SKILLS=(
  "tv-app-development"
  "spatial-navigation-engineering"
  "input-abstraction-layer"
  "ten-foot-information-architecture"
  "tv-search-ux"
  "auth-session-resilience"
  "personalization-upsell-decisioning"
  "leanback-data-layer-robustness"
  "tv-performance-profiling"
  "certification-aware-qa"
)

mkdir -p "$SKILLS_ROOT"

for skill in "${SKILLS[@]}"; do
  mkdir -p "$SKILLS_ROOT/$skill"
done

echo "Created skill repository structure at:"
echo "  $REPO_ROOT"
echo
echo "Directories:"
find "$REPO_ROOT" -type d | sort

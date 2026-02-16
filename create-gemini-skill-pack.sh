#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  create-gemini-skill-pack.sh [options] <skill-name> [<skill-name> ...]

Options:
  --skills-root <path>        Skills root directory (default: $HOME/.codex/skills)
  --out <file>                Output markdown file (default: ./GEMINI_SKILL_PACK.md)
  --title <text>              Pack title (default: "Codex Skills Adapter")
  --include-references        Inline references/*.md and references/*.txt content
  -h, --help                  Show this help

Example:
  ./create-gemini-skill-pack.sh \
    --out ./GEMINI_TV_SKILLS.md \
    --include-references \
    tv-app-development spatial-navigation-engineering input-abstraction-layer
EOF
}

SKILLS_ROOT="${HOME}/.codex/skills"
OUT_FILE="./GEMINI_SKILL_PACK.md"
TITLE="Codex Skills Adapter"
INCLUDE_REFERENCES=0
declare -a SKILLS=()

while (($#)); do
  case "$1" in
    --skills-root)
      SKILLS_ROOT="${2:-}"
      shift 2
      ;;
    --out)
      OUT_FILE="${2:-}"
      shift 2
      ;;
    --title)
      TITLE="${2:-}"
      shift 2
      ;;
    --include-references)
      INCLUDE_REFERENCES=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      while (($#)); do
        SKILLS+=("$1")
        shift
      done
      ;;
    -*)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
    *)
      SKILLS+=("$1")
      shift
      ;;
  esac
done

if ((${#SKILLS[@]} == 0)); then
  echo "At least one skill name is required." >&2
  usage
  exit 1
fi

for skill in "${SKILLS[@]}"; do
  if [[ ! -f "${SKILLS_ROOT}/${skill}/SKILL.md" ]]; then
    echo "Missing skill: ${SKILLS_ROOT}/${skill}/SKILL.md" >&2
    exit 1
  fi
done

mkdir -p "$(dirname "${OUT_FILE}")"

{
  echo "# ${TITLE}"
  echo
  echo "Generated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  echo "Source skills root: ${SKILLS_ROOT}"
  echo "Selected skills: ${SKILLS[*]}"
  echo
  echo "## How To Use In Gemini"
  echo "Paste this document into your Gemini system/developer instructions."
  echo "Ask Gemini to follow all \"Skill Instructions\" sections as operational rules."
  echo
  echo "---"
  echo
} > "${OUT_FILE}"

extract_description() {
  awk '
    BEGIN { in_frontmatter = 0 }
    NR == 1 && $0 == "---" { in_frontmatter = 1; next }
    in_frontmatter && $0 == "---" { exit }
    in_frontmatter && $0 ~ /^description:[[:space:]]*/ {
      sub(/^description:[[:space:]]*/, "", $0)
      print
      exit
    }
  ' "$1"
}

strip_frontmatter() {
  awk '
    NR == 1 && $0 == "---" { in_frontmatter = 1; next }
    in_frontmatter && $0 == "---" { in_frontmatter = 0; next }
    !in_frontmatter { print }
  ' "$1"
}

for skill in "${SKILLS[@]}"; do
  skill_dir="${SKILLS_ROOT}/${skill}"
  skill_md="${skill_dir}/SKILL.md"
  description="$(extract_description "${skill_md}")"

  {
    echo "## Skill: ${skill}"
    if [[ -n "${description}" ]]; then
      echo
      echo "Description: ${description}"
    fi
    echo
    echo "### Skill Instructions"
    echo
    strip_frontmatter "${skill_md}"
    echo
  } >> "${OUT_FILE}"

  if ((INCLUDE_REFERENCES == 1)) && [[ -d "${skill_dir}/references" ]]; then
    has_refs=0
    while IFS= read -r ref; do
      if ((has_refs == 0)); then
        {
          echo "### Reference Files (${skill})"
          echo
        } >> "${OUT_FILE}"
        has_refs=1
      fi
      {
        echo "#### $(basename "${ref}")"
        echo
        cat "${ref}"
        echo
      } >> "${OUT_FILE}"
    done < <(find "${skill_dir}/references" -type f \( -name "*.md" -o -name "*.txt" \) | sort)
  fi

  echo "---" >> "${OUT_FILE}"
  echo >> "${OUT_FILE}"
done

echo "Created Gemini skill pack: ${OUT_FILE}"

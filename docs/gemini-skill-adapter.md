# Gemini Adapter For Codex Skills

This adapter bundles one or more Codex skills into a single markdown file that can be pasted into Gemini instructions.

## Script

`/Users/an6106358/CRAVE_HTML_TV/html-tv-codex-skills/create-gemini-skill-pack.sh`

## 1. Generate A TV Skill Pack From Local Skills

```bash
/Users/an6106358/CRAVE_HTML_TV/html-tv-codex-skills/create-gemini-skill-pack.sh \
  --skills-root "$HOME/.codex/skills" \
  --out /Users/an6106358/CRAVE_HTML_TV/html-tv-codex-skills/GEMINI_TV_SKILLS.md \
  --include-references \
  tv-app-development \
  spatial-navigation-engineering \
  input-abstraction-layer \
  ten-foot-information-architecture \
  tv-search-ux \
  auth-session-resilience \
  personalization-upsell-decisioning \
  leanback-data-layer-robustness \
  tv-performance-profiling \
  certification-aware-qa
```

## 2. Use In Gemini

1. Open `/Users/an6106358/CRAVE_HTML_TV/html-tv-codex-skills/GEMINI_TV_SKILLS.md`.
2. Copy the full content.
3. Paste into Gemini system/developer instructions for your project.
4. Start prompts with the desired skill names (for example: `Use tv-app-development + input-abstraction-layer`).

## 3. Optional: Pull Skills From GitHub Repo First

Repo: [https://github.com/vageez/html-tv-codex-skills/](https://github.com/vageez/html-tv-codex-skills/)

```bash
python3 "$HOME/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py" \
  --repo vageez/html-tv-codex-skills \
  --path skills/tv-app-development \
  --path skills/spatial-navigation-engineering \
  --path skills/input-abstraction-layer \
  --path skills/ten-foot-information-architecture \
  --path skills/tv-search-ux \
  --path skills/auth-session-resilience \
  --path skills/personalization-upsell-decisioning \
  --path skills/leanback-data-layer-robustness \
  --path skills/tv-performance-profiling \
  --path skills/certification-aware-qa
```

Then run the pack generator command above.

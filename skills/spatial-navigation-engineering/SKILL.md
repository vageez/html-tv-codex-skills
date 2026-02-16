---
name: spatial-navigation-engineering
description: Engineer deterministic D-pad navigation for TV apps. Use when implementing or debugging focus graphs across rails, grids, tabs, dialogs, overlays, and deep-linked entry states for Samsung, LG, Hisense, Xbox, or PS5 targets.
---

# Spatial Navigation Engineering

## Overview
Define explicit, testable focus behavior for every navigable screen state.
Prefer deterministic focus maps over implicit DOM order.

## Workflow
1. Map each screen into focus zones (hero, rail, tab row, metadata panel, CTA cluster).
2. Declare directional transitions per focusable node: up, down, left, right.
3. Add wrap rules only where product requires carousel behavior.
4. Implement overlay focus traps with explicit escape targets.
5. Define fallback focus recovery when the previous node disappears after refresh or entitlement changes.

## Implementation Rules
- Entering any route: place focus on the route's primary actionable element.
- Opening a modal/overlay: trap focus inside; Back closes overlay first.
- Closing overlay: restore focus to launch origin when still visible.
- Missing origin: restore to a stable route-level default target.
- Dynamic rails: keep logical index continuity when items insert/remove.

## Validation Checklist
- No dead-end nodes in any direction.
- No accidental wrap between unrelated zones.
- Focus indicator remains visible and high-contrast on all backgrounds.
- Deep links land on meaningful focus, not page chrome.
- Back never strands user in non-focusable state.

## References
- Use `references/focus-map-template.md` for map schema and screen-by-screen checklists.

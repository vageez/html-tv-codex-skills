---
name: ten-foot-information-architecture
description: Design and implement 10-foot TV information architecture for browse, details, and playback flows. Use when defining distance-readable layouts, minimizing steps, and enforcing strong focus affordances in React TV apps.
---

# Ten-Foot Information Architecture

## Overview
Optimize screens for distance readability, low cognitive load, and directional navigation.
Prioritize fewer decisions per view with clear primary actions.

## IA Rules
- Keep primary CTA visible above fold on details screens.
- Limit concurrent choices per row to avoid focus hunting.
- Group metadata into short, scannable blocks.
- Keep navigation hierarchy shallow for Back predictability.

## Workflow
1. Define user intent per screen (browse, decide, play, recover).
2. Rank actions by priority and map to first-focus, second-focus, overflow.
3. Reduce branch complexity before adding new rails or tabs.
4. Design explicit empty/error states with valid focusable actions.
5. Confirm all flows are fully operable with directional keys only.

## Visual Interaction Requirements
- Strong focus ring contrast over bright hero art.
- Clear state separation for focused, selected, disabled.
- Legible type scale for typical viewing distance.

## Validation Checklist
- First meaningful action reachable in <= 3 moves from entry focus.
- No required task depends on text entry unless unavoidable.
- No dead-end state without clear recovery CTA.

## References
- Use `references/layout-heuristics.md` for page templates and spacing heuristics.

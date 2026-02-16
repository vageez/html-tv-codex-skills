---
name: tv-search-ux
description: Build robust TV search experiences for remote input. Use when implementing keyboard state handling, remote-entry debouncing, suggestions/history, and voice-search integration hooks for TV platforms.
---

# TV Search UX

## Overview
Treat search as a state machine, not a single text input.
Optimize for remote latency, IME variability, and low-typing interaction.

## Search State Model
- `IDLE`: no query, show history/trending.
- `KEYBOARD_OPEN`: OSK active; focus ownership clearly defined.
- `TYPING`: remote key entry in progress.
- `LOADING`: request in-flight with cancellable stale queries.
- `RESULTS`: ranked rows with deterministic focus defaults.
- `ERROR`: actionable recovery with focus-safe retry.

## Workflow
1. Define keyboard open/close transitions and focus restore targets.
2. Tune debounce for remote input cadence, not desktop keyboard speed.
3. Prioritize suggestions/history to reduce full query entry.
4. Add hooks for voice intent injection into the same query pipeline.
5. Preserve search context across suspend/resume.

## Reliability Rules
- Cancel stale requests on new query.
- Keep Back behavior deterministic: close keyboard, then leave search route.
- Never drop focus on async result refresh.

## Validation Checklist
- Query latency feedback is visible without jitter.
- Suggestion accept path needs minimal key presses.
- IME/OSK transitions never trap focus.

## References
- Use `references/search-state-machine.md` for transition table and event contract.

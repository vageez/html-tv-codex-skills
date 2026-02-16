---
name: auth-session-resilience
description: Implement resilient TV authentication and session behavior. Use when building device-code or QR login, token refresh handling, idle timeout UX, and expired-session recovery flows without navigation dead ends.
---

# Auth Session Resilience

## Overview
Favor second-screen and device-code flows over full credential entry on TV.
Design auth and session recovery as interruption-safe state transitions.

## Workflow
1. Choose default login path: QR/device code first, credentials fallback second.
2. Define auth route entry/exit focus targets for every state.
3. Implement proactive token refresh with bounded retry/backoff.
4. Build expired-session interception that preserves pre-auth intent.
5. Resume user action after re-auth when safe and authorized.

## Recovery Rules
- Expired token during browse: route to lightweight re-auth prompt.
- Expired token during playback: preserve playback context and return safely.
- Failed refresh: avoid loops; present explicit next action.
- Idle timeout: warn, allow extension, then perform clean logout.

## Validation Checklist
- No auth state can strand user with no focusable CTA.
- Back from auth screens follows product-defined safe path.
- Re-auth returns user to prior intent context whenever possible.

## References
- Use `references/auth-recovery-flows.md` for flow diagrams and edge-case handling.

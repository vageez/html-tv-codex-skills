---
name: leanback-data-layer-robustness
description: Engineer robust data delivery for leanback TV browsing. Use when implementing prefetching, caching, skeleton loading, retry/backoff, and focus-safe empty/error states for catalog-heavy TV interfaces.
---

# Leanback Data Layer Robustness

## Overview
Keep catalog browsing smooth under variable network and device constraints.
Design data failures and loading states to preserve navigation continuity.

## Workflow
1. Define fetch hierarchy: above-fold first, adjacent rails second, deep catalog third.
2. Add predictive prefetch for likely next rail/page transitions.
3. Cache by route and content cluster with explicit invalidation windows.
4. Implement retry/backoff with jitter and user-visible recovery CTA.
5. Preserve focus during loading, partial data, and error replacement.

## State Design
- `SKELETON`: preserve layout geometry to avoid focus jump.
- `PARTIAL`: show available rails while slower rails continue loading.
- `EMPTY`: provide clear alternate actions.
- `ERROR`: expose retry and fallback navigation.

## Validation Checklist
- Rail-to-rail movement remains responsive during fetch activity.
- Focus target survives data refresh and pagination append.
- Empty/error states do not collapse focus tree.

## References
- Use `references/prefetch-retry-strategy.md` for cache and retry policy templates.

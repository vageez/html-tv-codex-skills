---
name: tv-performance-profiling
description: Profile and improve TV app runtime performance. Use when measuring and reducing time-to-interactive, rail scroll jank, image decode pressure, main-thread spikes, and memory churn on low-end TV and console hardware.
---

# TV Performance Profiling

## Overview
Measure user-visible performance first, then map bottlenecks to rendering, data, and media pipelines.
Prioritize stable navigation and playback over synthetic benchmark gains.

## Metrics to Track
- Time to interactive from cold launch and resume.
- Focus-move latency under catalog load.
- Rail scroll FPS and dropped-frame bursts.
- Image decode time and memory footprint.
- Main-thread long tasks and GC churn.

## Workflow
1. Define target budgets per device tier.
2. Capture traces for browse, search, details, and playback transitions.
3. Attribute hotspots to JS, layout, image decode, or networking.
4. Apply fixes (virtualization, image sizing, memoization, prefetch tuning).
5. Re-measure and compare against baseline budgets.

## Optimization Rules
- Keep above-fold render path minimal.
- Defer non-critical metadata rendering.
- Use deterministic image size policy to reduce decode spikes.
- Avoid synchronous work in input handlers.

## Validation Checklist
- TTI and focus latency are within target budgets.
- Scroll jank decreases after each optimization pass.
- Memory growth stabilizes over long browse sessions.

## References
- Use `references/perf-metrics-plan.md` for benchmark templates and per-platform budgets.

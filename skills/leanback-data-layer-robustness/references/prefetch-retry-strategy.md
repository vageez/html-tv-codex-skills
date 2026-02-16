# Prefetch and Retry Strategy

## Fetch Priority
1. Route-critical data
2. Current rail continuation
3. Neighbor rails
4. Recommendation expansions

## Retry Policy
- Immediate retry count:
- Exponential backoff base ms:
- Max retry delay ms:
- Retryable status codes:

## Focus Safety Rules
- Keep focused item shell mounted while refreshing.
- On item removal, move focus to nearest sibling.
- On rail failure, move focus to rail-level retry CTA.

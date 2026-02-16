# Search State Machine

## Events
- OPEN_KEYBOARD
- CLOSE_KEYBOARD
- INPUT_CHANGED
- SUBMIT_QUERY
- REQUEST_SUCCESS
- REQUEST_ERROR
- BACK_PRESSED

## Transition Table
| Current | Event | Next | Notes |
|---|---|---|---|
| IDLE | OPEN_KEYBOARD | KEYBOARD_OPEN | focus input |
| KEYBOARD_OPEN | INPUT_CHANGED | TYPING | start debounce |
| TYPING | SUBMIT_QUERY | LOADING | cancel prior request |
| LOADING | REQUEST_SUCCESS | RESULTS | focus top result |
| LOADING | REQUEST_ERROR | ERROR | focus retry |

## Focus Ownership Rules
- Input owns focus when OSK visible.
- Result list owns focus when OSK hidden and results loaded.

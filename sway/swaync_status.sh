#!/bin/bash

echo '{"version":1,"click_events":true}'
echo '['

# Start swaync in a coprocess
coproc SWAYNC { swaync-client -swb 2>/dev/null; }

FIRST=""

# Main loop - read from both stdin (clicks) and swaync output
while true; do
    # Check if there's input from swaync
    if read -t 0.1 -u ${SWAYNC[0]} line; then
        COUNT=$(echo "$line" | grep -oP '(?<="text": ")[^"]*')
        OUTPUT="{\"full_text\":\"Notifications: $COUNT\",\"name\":\"swaync\"}"
        
        if [ "$FIRST" != "done" ]; then
            echo "[$OUTPUT]"
            FIRST="done"
        else
            echo ",[$OUTPUT]"
        fi
    fi
    
    # Check if there's a click event from stdin
    if read -t 0.1 line; then
        if echo "$line" | grep -q '"name"[[:space:]]*:[[:space:]]*"swaync"'; then
            swaync-client -t -sw >/dev/null 2>&1
        fi
    fi
done

#!/bin/bash

# Reliable Vite development startup script
# Usage: ./start-dev.sh
# Press Ctrl+C to stop the dev server when done

# Cleanup function
cleanup() {
    echo ""
    echo "Stopping Vite dev server..."
    kill $VITE_PID 2>/dev/null
    exit 0
}
trap cleanup SIGINT SIGTERM

# Kill any existing Vite dev server for THIS project
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
for pid in $(pgrep -f "vite.*$PROJECT_DIR" 2>/dev/null); do
    kill "$pid" 2>/dev/null
done
sleep 1

echo "Starting Vite dev server..."

# Start Vite in the background, redirect output to a log file
npx vite > /tmp/vite-dev.log 2>&1 &
VITE_PID=$!

echo "Vite PID: $VITE_PID"
echo "Waiting for dev server to be ready..."

# Wait for Vite to be ready
MAX_WAIT=30
WAITED=0

while true; do
    if ! kill -0 $VITE_PID 2>/dev/null; then
        echo "Vite process died. Check /tmp/vite-dev.log"
        tail -20 /tmp/vite-dev.log
        exit 1
    fi

    # Check if Vite is responding
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:5173" 2>/dev/null)
    if [ "$STATUS" = "200" ]; then
        break
    fi

    sleep 1
    WAITED=$((WAITED + 1))
    if [ $WAITED -ge $MAX_WAIT ]; then
        echo "Timed out waiting for Vite dev server"
        tail -20 /tmp/vite-dev.log
        exit 1
    fi
done

echo ""
echo "================================================"
echo "Vite dev server is running at http://localhost:5173"
echo "Press Ctrl+C to stop when you're done."
echo "================================================"

# Keep script running to show Vite output
tail -f /tmp/vite-dev.log

#!/bin/bash

JAR_FILE="*.jar"
PID_FILE="app.pid"

case "$1" in
    start)
        if [ -f "$PID_FILE" ]; then
            echo "Application is already running."
        else
            nohup java -jar "$JAR_FILE" > output.log 2>&1 &
            echo $! > "$PID_FILE"
            echo "Application started..."
        fi
        ;;
    
    stop)
        if [ -f "$PID_FILE" ]; then
            kill $(cat "$PID_FILE")
            rm "$PID_FILE"
            echo "Application stopped..."
        else
            echo "No running application found."
        fi
        ;;
    
    status)
        if [ -f "$PID_FILE" ]; then
            PID=$(cat "$PID_FILE")
            if ps -p $PID > /dev/null; then
                echo "Application is running (PID: $PID)."
            else
                echo "PID file exists but application is not running."
            fi
        else
            echo "Application is not running."
        fi
        ;;
    
    *)
        echo "Usage: $0 {start|stop|status}"
        ;;
esac

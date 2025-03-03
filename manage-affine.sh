#!/bin/bash

SERVER="root@82.29.167.194"

show_menu() {
    echo -e "\nAFFiNE Remote Management"
    echo "======================"
    echo "Usage: ./manage-affine.sh <action>"
    echo "Actions:"
    echo "  start   - Start AFFiNE services"
    echo "  stop    - Stop AFFiNE services"
    echo "  status  - Check AFFiNE status"
    echo "  logs    - View AFFiNE logs"
    echo "  restart - Restart AFFiNE services"
}

case "$1" in
    start)
        echo "Starting AFFiNE..."
        ssh $SERVER "cd ~/affine && docker compose up -d"
        ;;
    stop)
        echo "Stopping AFFiNE..."
        ssh $SERVER "cd ~/affine && docker compose down"
        ;;
    status)
        echo "Checking AFFiNE status..."
        ssh $SERVER "echo 'Docker Containers:' && docker ps && echo -e '\nSystem Resources:' && free -h && echo -e '\nDisk Usage:' && df -h"
        ;;
    logs)
        echo "Fetching AFFiNE logs..."
        ssh $SERVER "docker logs affine_server"
        ;;
    restart)
        echo "Restarting AFFiNE..."
        ssh $SERVER "cd ~/affine && docker compose restart"
        ;;
    *)
        show_menu
        ;;
esac 
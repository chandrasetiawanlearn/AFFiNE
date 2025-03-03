# PowerShell script to manage AFFiNE remotely
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('start', 'stop', 'status', 'logs', 'restart')]
    [string]$action
)

$SERVER = "root@82.29.167.194"
$SSH_KEY = "$env:USERPROFILE\.ssh\affine_key"

function Show-Menu {
    Write-Host "`nAFFiNE Remote Management"
    Write-Host "======================"
    Write-Host "Usage: ./manage-affine.ps1 <action>"
    Write-Host "Actions:"
    Write-Host "  start   - Start AFFiNE services"
    Write-Host "  stop    - Stop AFFiNE services"
    Write-Host "  status  - Check AFFiNE status"
    Write-Host "  logs    - View AFFiNE logs"
    Write-Host "  restart - Restart AFFiNE services"
}

switch ($action) {
    'start' {
        Write-Host "Starting AFFiNE..."
        ssh -i $SSH_KEY $SERVER "cd ~/affine && docker compose up -d"
    }
    'stop' {
        Write-Host "Stopping AFFiNE..."
        ssh -i $SSH_KEY $SERVER "cd ~/affine && docker compose down"
    }
    'status' {
        Write-Host "Checking AFFiNE status..."
        ssh -i $SSH_KEY $SERVER 'echo "=== Docker Containers ==="; docker ps; echo; echo "=== System Resources ==="; free -h; echo; echo "=== Disk Usage ==="; df -h'
    }
    'logs' {
        Write-Host "Fetching AFFiNE logs..."
        ssh -i $SSH_KEY $SERVER "docker logs affine_server"
    }
    'restart' {
        Write-Host "Restarting AFFiNE..."
        ssh -i $SSH_KEY $SERVER "cd ~/affine && docker compose restart"
    }
    default {
        Show-Menu
    }
}
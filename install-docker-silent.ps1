# Silent installation script for Docker Desktop
# Run this script as administrator

$installerPath = "C:\Users\ad1328\Downloads\Docker Desktop Installer.exe"

# Check if the installer exists
if (-not (Test-Path $installerPath)) {
    Write-Host "Docker Desktop Installer not found at $installerPath" -ForegroundColor Red
    exit 1
}

Write-Host "Starting silent installation of Docker Desktop..." -ForegroundColor Green

# Install Docker Desktop silently
Start-Process -FilePath $installerPath -ArgumentList "install", "--quiet" -Wait

Write-Host "Docker Desktop installation completed. You may need to restart your computer." -ForegroundColor Green 
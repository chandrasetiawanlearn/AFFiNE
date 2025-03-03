@echo off
if "%1"=="" (
    echo Usage: affine [start^|stop^|status^|logs^|restart]
    echo.
    echo Commands:
    echo   start   - Start AFFiNE services
    echo   stop    - Stop AFFiNE services
    echo   status  - Check AFFiNE status
    echo   logs    - View AFFiNE logs
    echo   restart - Restart AFFiNE services
    exit /b 1
)

powershell -ExecutionPolicy Bypass -File "%~dp0manage-affine.ps1" %1 
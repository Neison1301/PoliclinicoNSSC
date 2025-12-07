@echo off
REM ============================================
REM Script de Detención - Policlínico NSSC
REM ============================================

echo ========================================
echo   POLICLINICO NSSC - STOP SCRIPT
echo ========================================
echo.

echo Deteniendo contenedores...
docker-compose down
echo.

echo ========================================
echo   CONTENEDORES DETENIDOS
echo ========================================
echo.
echo Los datos se mantienen en el volumen Docker
echo Para eliminar todo (incluyendo datos): cleanup.bat
echo.
pause

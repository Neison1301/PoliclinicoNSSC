@echo off
REM ============================================
REM Script de Limpieza - Policlínico NSSC
REM ============================================

echo ========================================
echo   POLICLINICO NSSC - CLEANUP SCRIPT
echo ========================================
echo.
echo [ADVERTENCIA] Este script eliminara:
echo   - Todos los contenedores
echo   - Todas las imagenes del proyecto
echo   - Todos los volumenes (DATOS DE LA BD)
echo.
set /p confirm="Estas seguro? (S/N): "
if /i not "%confirm%"=="S" (
    echo Operacion cancelada
    pause
    exit /b 0
)
echo.

echo [1/4] Deteniendo contenedores...
docker-compose down
echo.

echo [2/4] Eliminando volumenes...
docker-compose down -v
echo.

echo [3/4] Eliminando imagenes...
docker rmi policlinicosagradocorazon-app mysql:8.0 2>nul
echo.

echo [4/4] Limpiando recursos no utilizados...
docker system prune -f
echo.

echo ========================================
echo   LIMPIEZA COMPLETADA
echo ========================================
echo.
pause

@echo off
REM ============================================
REM Script de Inicio - Policlínico NSSC
REM ============================================

echo ========================================
echo   POLICLINICO NSSC - START SCRIPT
echo ========================================
echo.

REM Verificar si existe .env
if not exist .env (
    echo [ERROR] No se encontro el archivo .env
    echo Por favor ejecuta build.bat primero
    pause
    exit /b 1
)

echo [1/3] Iniciando contenedores...
docker-compose up -d
if errorlevel 1 (
    echo [ERROR] Fallo al iniciar los contenedores
    exit /b 1
)
echo.

echo [2/3] Esperando que los servicios esten listos...
timeout /t 10 /nobreak > nul
echo.

echo [3/3] Verificando estado de los contenedores...
docker-compose ps
echo.

echo ========================================
echo   APLICACION INICIADA
echo ========================================
echo.
echo La aplicacion esta disponible en:
echo   - URL: http://localhost:8080/policlinico
echo   - MySQL: localhost:3307
echo.
echo Para ver los logs: docker-compose logs -f
echo Para detener: stop.bat
echo.
pause

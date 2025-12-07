@echo off
REM ============================================
REM Script de Construcción - Policlínico NSSC
REM ============================================

echo ========================================
echo   POLICLINICO NSSC - BUILD SCRIPT
echo ========================================
echo.

REM Verificar si existe .env
if not exist .env (
    echo [ADVERTENCIA] No se encontro el archivo .env
    echo Copiando .env.example a .env...
    copy .env.example .env
    echo.
    echo [IMPORTANTE] Por favor edita el archivo .env con tus credenciales
    echo Presiona cualquier tecla para continuar o CTRL+C para cancelar...
    pause > nul
)

echo [1/4] Limpiando contenedores anteriores...
docker-compose down -v
echo.

echo [2/4] Compilando aplicacion con Maven...
call mvnw.cmd clean package -DskipTests
if errorlevel 1 (
    echo [ERROR] Fallo la compilacion de Maven
    exit /b 1
)
echo.

echo [3/4] Construyendo imagenes Docker...
docker-compose build --no-cache
if errorlevel 1 (
    echo [ERROR] Fallo la construccion de imagenes Docker
    exit /b 1
)
echo.

echo [4/4] Verificando imagenes creadas...
docker images | findstr policlinico
echo.

echo ========================================
echo   BUILD COMPLETADO EXITOSAMENTE
echo ========================================
echo.
echo Para iniciar la aplicacion ejecuta: start.bat
echo.
pause

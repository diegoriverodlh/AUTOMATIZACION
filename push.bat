@echo off
:: Forzar codificación UTF-8 para evitar problemas con tildes en el mensaje de commit
chcp 65001 > nul

:: Ir al directorio actual de tu proyecto
cd /d "C:\Users\driverod\OneDrive - NTT DATA EMEAL\Documentos\AUTOMATIZACION"

echo =======================================
echo  Actualizando repositorio: AUTOMATIZACION
echo =======================================
echo.

:: 1. Crear .gitignore si no existe para proteger archivos sensibles
if not exist .gitignore (
    echo [*] Creando archivo .gitignore de seguridad...
    (
        echo # Archivos temporales de Python
        echo __pycache__/
        echo *.pyc
        echo.
        echo # Claves y configuracion local
        echo .env
        echo local_test.py
        echo local_test_mock.py
    ) > .gitignore
)

:: 2. Inicializar Git si no se ha configurado aún en esta carpeta
if not exist .git (
    echo [*] Inicializando repositorio Git local...
    git init
    git branch -M main
    echo.
    echo --------------------------------------------------------
    echo NOTA: Si es la primera vez, necesitarás asociar el remoto.
    echo Puedes hacerlo ejecutando en tu terminal:
    echo git remote add origin https://github.com/diegoriverodlh/AUTOMATIZACION.git
    echo --------------------------------------------------------
    echo.
)

:: 3. Proceso de Git
echo [*] Añadiendo cambios...
git add .

echo.
set /p mensaje="Mensaje del commit: "

echo.
echo [*] Generando commit...
git commit -m "%mensaje%"

echo.
echo [*] Subiendo cambios a GitHub...
git push origin main

echo.
echo =======================================
echo  Push completado con éxito.
echo =======================================
pause
@echo off
D: 
cd XAMPPP\htdocs\laravel-tutorial\
cd oliver-rein\
		REM Zeige das aktuelle Verzeichnis an
echo Aktuelles Verzeichnis: %cd%

IF EXIST artisan (
    echo "Starte Laravel Server..."
    php artisan serve --host=127.0.0.1 --port=8081 
) ELSE (
    echo "Das Laravel-Projekt wurde nicht gefunden."
)

pause

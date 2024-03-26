@echo off

rem Verifier si le fichier .env existe
echo Verification de l'existence du fichier .env...
if not exist .env (
    echo Fichier .env n'existe pas.
    exit /b 1
)
echo Fichier .env existe.

echo Configuration du projet Symfony...
rem Verifier si le fichier composer.json existe
if not exist composer.json (
    echo Fichier composer.json n'existe pas.
    exit /b 1
)

echo Fichier composer.json existe.
echo Installation des dependances via Composer...
rem Installation des dependances via Composer
rem composer install


echo Configuration de la base de donnees...
echo Creation de la base de donnees...

rem Creation de la base de donnees si elle n'existe pas
php bin/console doctrine:database:create --if-not-exists

if %errorlevel% neq 0 (
    echo Erreur lors de la creation de la base de donnees.
    exit /b 1
)
echo Base de donnees creee.
echo Generation des entites...
rem Generation des migrations
php bin/console make:migration

echo Entites generees.
echo Execution des migrations...
rem Execution des migrations pour mettre à jour la base de donnees
php bin/console doctrine:migrations:migrate
echo Migrations executees.

if %errorlevel% neq 0 (
    echo Erreur lors de l'execution des migrations.
    exit /b 1
)

echo Configuration du projet Symfony terminee.

pause

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

echo Creation de la base de donnees...

rem Creation de la base de donnees si elle n'existe pas 
php bin/console doctrine:database:create --if-not-exists --no-ansi

echo Generation de la Migrations...
rem Vérification si le dossier Migration existe et est vide
if not exist .\migrations\ (
    echo Dossier Migrations n'existe pas.
    echo Generation du dossier Migrations...
    mkdir .\migrations\
    echo Dossier Migrations cree.
) else (
    echo Dossier Migrations existe.
    echo Suppression des fichiers du dossier Migrations...
    del /q /s .\migrations\Version*.php
    echo Fichiers supprimes.
)

echo Migration en cours...
rem Generation des migrations
php bin/console make:migration

echo Execution de la migration...
rem Execution des migrations pour mettre à jour la base de donnees
php bin/console doctrine:migrations:migrate

if %errorlevel% neq 0 (
    echo Erreur lors de l'execution des migrations.
    exit /b 1
)

echo Configuration du projet Symfony terminee.

pause

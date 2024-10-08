@echo off
:: script based on  sourceforge postgres 10.1.1 (already taken offline)
::              and https://www.postgresonline.com/journal/archives/172-Starting-PostgreSQL-in-windows-without-install.html
title FHTW - PostgreSQL portable version
cls

:: set default code page
chcp 1252 > nul

:: ensure variables set
if not defined PGSQL set PGSQL=%~dp0\pgsql\
if not defined PGDATA set PGDATA=%PGSQL%..\Data\data
if not defined PGLOG set PGLOG=%PGSQL%..\Data\log.txt
if not defined PGLOCALDIR set PGLOCALDIR=%PGSQL%share
if not defined PGDATABASE set PGDATABASE=plannerapplication
if not defined PGPORT set PGPORT=5432
if not defined PGUSER set PGUSER=postgres

:: initialise a new database on first use
if not exist "%PGDATA%" (
    echo.
    echo Initialising database for first use, please wait...
    "%PGSQL%\bin\initdb" -U %PGUSER% -A trust -E utf8 --locale=C >nul
)

:: startup postgres server
echo.
"%PGSQL%\bin\pg_ctl" -D "%PGDATA%" -l "%PGLOG%" -w start
"%PGSQL%\bin\psql.exe" --port=%PGPORT% --dbname="postgres" --username="%PGUSER%" -c "CREATE DATABASE %PGDATABASE%;"

cls
echo.
echo Type \q to quit and shutdown server
echo.
"%PGSQL%\bin\psql.exe" --port=%PGPORT% --dbname="%PGDATABASE%" --username="%PGUSER%"
echo.
"%PGSQL%\bin\pg_ctl" -D "%PGDATA%" stop

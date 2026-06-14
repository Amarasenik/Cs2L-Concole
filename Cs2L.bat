::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFC5HSRa+GG6pDaET+NTY/LirnkASUPczfZzn87eBLtww+RfIfJUi2DRTm8Rs
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAjk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZkoaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQITG0l4DAeNMmi1CrB8
::eg0/rx1wNQPfEVWB+kM9LVsJDAeRbmfa
::fBEirQZwNQPfEVWB+kM9LVsJDAeRbmfa
::cRolqwZ3JBvQF1fEqQIdKRJaDAKLMG7a
::dhA7uBVwLU+EWFiJ9VAxOx5aRQ/i
::YQ03rBFzNR3SWATE9U8xOhpHSQqLNws=
::dhAmsQZ3MwfNWATE9U8xOhpHSQqLNws=
::ZQ0/vhVqMQ3MEVWAtB9wKRZVXgWROWWzDdU=
::Zg8zqx1/OA3MEVWAtB9wKRZVXgWROWWzDdU=
::dhA7pRFwIByZRRmX4EMiPHs=
::Zh4grVQjdCyDJGyX8VAjFC5HSRa+GG6pDaET+NTY/Lirnm4uBs5xfZfeug==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983




@echo off
title CS2L concole

:: Создаем переменную для кодировки по умолчанию (если еще не меняли)
if "%my_chcp%"=="" set "my_chcp=65001"

:menu
title CS2L Menu
:: Применяем выбранную кодировку
chcp %my_chcp% > nul

cls
echo ==========2L main menu==========
echo.
echo Игры:
echo --1. Cs2 First release
echo --2. Cs2 new
echo --3. CS:GO (appid:730)
echo --4. CS:GO FIRST 2012
echo.
echo Опции:
echo --O1. Настройки
echo --O2. Fix font bug/починить баг с каракулями вместо слов
echo --O3. Выход
echo.
echo M. Управление скачаными играми(недоступно)
echo ================================
echo Внимание! Опции пишуться с большой английской буквой O.
echo.
echo.

:: Исправлено: ввод через /p
set /p "choice=Выбор: "

:: --------------Код менюшки (Дописан)----------------
if "%choice%"=="1" goto reg & goto cs2first
if "%choice%"=="2" goto reg & goto cs2new
if "%choice%"=="3" goto reg & goto csgo730
if "%choice%"=="4" goto reg & goto csgofirst
if "%choice%"=="O1" echo [^>_] Настройки пока в разработке! & pause & goto menu
if "%choice%"=="O2" goto fontfix
if "%choice%"=="O3" exit
goto menu


:: ---------------------------код фикса---------------------
:fontfix
cls
echo ========== FIX FONT BUG ==========
echo.
echo Выберите кодировку для консоли:
echo 1 = chcp 1251 (Старая кодировка Windows, если вместо букв знаки вопроса)
echo 2 = chcp 65001 (Современный UTF-8, стандартный для VS Code)
echo 3 = Не делать ничего, оставить обычную
echo.
echo ==================================

:: Исправлено: ввод через /p
set /p "font_choice=chcp: "

if "%font_choice%"=="1" set "my_chcp=1251"
if "%font_choice%"=="2" set "my_chcp=65001"
if "%font_choice%"=="3" goto menu

goto menu


:: ==================================================
:: НАСТРОЙКИ: Путь к DepotDownloader в папке modules
:: %~dp0 — это магия батников, которая сама находит путь к папке с этим скриптом
set "DEPOT_EXE=%~dp0modules\depotdownloader.exe"
:: ==================================================






:: games db

::-app 730 -depot 2347770 -manifest 4473487723012660428

::-app 730 -depot 2347771 -manifest 3805708056119697931



:reg
echo Зарегестрируйтесь!
echo Внимание! Изза правил стима не выйдет скачать фулл игру без входа в аккаунт. как мы обрабатываем ваши банные можно почитать в папке readme/datamanagment.txt
echo Штобы войти как анонимус без регистрации, оставте поле пустым.
echo При скачивании игры вас попросят ввести код steam guard
set /p "steam_user= Логин:"
set /p "steam_pass= Пароль:"
echo Данные приняты.
:: Если логин заполнен, формируем аргумент -username
if not "%steam_user%"=="" set "userarg=-username %steam_user%"

:: Если пароль заполнен, формируем аргумент -password
if not "%steam_pass%"=="" set "passarg=-password %steam_pass%"




:: ===================Cs2old=====================
:cs2first
set "gamename=cs2first"
mkdir %~dp0download\%gamename%
set "gamedir=%~dp0download\%gamename%"
title Downloading %gamename% - Cs2L Concole
cls

:: Установка
echo ====================================================
echo.
echo  Игра: cs2first 
echo  Нажмите любую кнопку, чтобы начать установку.
echo.
echo ====================================================
echo.
pause > nul 


echo ====================================================
echo  Начало загрузки
echo  Игра: Cs2first (первая версия)
echo  инфа: app:730, depot 2347770 manifest 4473487723012660428
echo ====================================================
echo.

echo [1/2] Скачиваем основной контент (Депот 2347770)...




%~dp0modules\depotdownloader.exe -app 730 -depot 2347770 -manifest 4473487723012660428 -dir "%gamedir%" %userarg% %passarg%
if %errorlevel% neq 0 (
    echo [ОШИБКА] Сбой на первом депоте!
    pause
    goto menu
)



echo.
echo ====================================================
echo [УСПЕХ] Первый депот готов! Качаем исполняемые файлы.
echo ====================================================
echo.





:: Шаг 2: Скачивание Windows-файлов запуска (Депот 2347771)

echo [2/2] Скачиваем файлы запуска win64 (Депот 2347771)...



%~dp0modules\depotdownloader.exe -app 730 -depot 2347771 -manifest 3805708056119697931 -dir "%gamedir%" %userarg% %passarg%
if %errorlevel% neq 0 (
    echo [ОШИБКА] Сбой на втором депоте!
    pause
    goto menu
)
::==============================================================







:: ===================Cs2new=====================
:cs2new
set "gamename=cs2new"
mkdir %~dp0download\%gamename%
set "gamedir=%~dp0download\%gamename%"
title Downloading %gamename% - Cs2L Concole
cls

:: Установка
echo ====================================================
echo.
echo  Игра: CS2new 
echo  Нажмите любую кнопку, чтобы начать установку.
echo.
echo ====================================================
echo.
pause > nul 


echo ====================================================
echo  Начало загрузки
echo  Игра: CS2 (последняя версия)
echo  инфа: app:730, depot 2347770 
echo ====================================================
echo.

echo [1/2] Скачиваем основной контент (Депот 2347770)...




%~dp0modules\depotdownloader.exe -app 730 -depot 2347770 -dir "%gamedir%" %userarg% %passarg%
if %errorlevel% neq 0 (
    echo [ОШИБКА] Сбой на первом депоте!
    pause
    goto menu
)



echo.
echo ====================================================
echo [УСПЕХ] Первый депот готов! Качаем исполняемые файлы.
echo ====================================================
echo.





:: Шаг 2: Скачивание Windows-файлов запуска (Депот 2347771)

echo [2/2] Скачиваем файлы запуска win64 (Депот 2347771)...



%~dp0modules\depotdownloader.exe -app 730 -depot 2347771 -dir "%gamedir%" %userarg% %passarg%
if %errorlevel% neq 0 (
    echo [ОШИБКА] Сбой на втором депоте!
    pause
    goto menu
)
::==============================================================



:: ===================Csgo 730=====================
:csgo730
set "gamename=csgo app730"
mkdir %~dp0download\%gamename%
set "gamedir=%~dp0download\%gamename%"
title Downloading %gamename% - Cs2L Concole
cls

:: Установка
echo ====================================================
echo.
echo  Игра: CS:GO legacy(appid:730) 
echo  Нажмите любую кнопку, чтобы начать установку.
echo.
echo ====================================================
echo.
pause > nul 


echo ====================================================
echo  Начало загрузки
echo  Игра: csgo (appid:730)
echo  инфа: app:730  
echo ====================================================
echo.

echo [1/2] Скачиваем основной контент...




%~dp0modules\depotdownloader.exe -app 730 -depot 731 -manifest 1224088799001669801 -dir "%gamedir%" %userarg% %passarg%
if %errorlevel% neq 0 (
    echo [ОШИБКА] Сбой на первом депоте!
    pause
    goto menu
)



echo.
echo ====================================================
echo [УСПЕХ] Первый депот готов! Качаем исполняемые файлы.
echo ====================================================
echo.





:: Шаг 2: Скачивание Windows-файлов запуска

echo [2/2] Скачиваем файлы запуска win64...



%~dp0modules\depotdownloader.exe -app 730 -depot 732 -manifest 6314304446937576250 -dir "%gamedir%" %userarg% %passarg%
if %errorlevel% neq 0 (
    echo [ОШИБКА] Сбой на втором депоте!
    pause
    goto menu
)
::==============================================================


:: ===================csgo FIRST=====================
:csgofirst
set "gamename=csgofirst"
mkdir %~dp0download\%gamename%
set "gamedir=%~dp0download\%gamename%"
title Downloading %gamename% - Cs2L Concole
cls

:: Установка
echo ====================================================
echo.
echo  Игра: CSGO first 
echo  Нажмите любую кнопку, чтобы начать установку.
echo.
echo ====================================================
echo.
pause > nul 


echo ====================================================
echo  Начало загрузки
echo  Игра: CS:GO (первая версия для совсем отбитых)
echo  инфа: кому в голову взбрядет качать такую старую игру? конешно мне, создателю етого лаунчера 
echo ====================================================
echo.

echo [1/2] Скачиваем основной контент...




%~dp0modules\depotdownloader.exe -app 730 -depot 731 -manifest 8917601652689682225 -dir "%gamedir%" %userarg% %passarg%
if %errorlevel% neq 0 (
    echo [ОШИБКА] Сбой на первом депоте!
    pause
    goto menu
)



echo.
echo ====================================================
echo [УСПЕХ] Первый депот готов! Качаем исполняемые файлы.
echo ====================================================
echo.





:: Шаг 2: Скачивание Windows-файлов запуска (Депот 2347771)

echo [2/2] Скачиваем файлы запуска win64...



%~dp0modules\depotdownloader.exe -app 730 -depot 732 -manifest 5384752978584135997 -dir "%gamedir%" %userarg% %passarg%
if %errorlevel% neq 0 (
    echo [ОШИБКА] Сбой на втором депоте!
    pause
    goto menu
)
::==============================================================



















echo.
echo ====================================================
echo  Игра установлена. Нажмите на любую кнопку, чтобы перейти в меню.
echo ====================================================
pause > nul
goto menu









@echo off
setlocal enabledelayedexpansion
cls
:MainMenu
echo ===================================================
echo               QEMU-IMG UTILITY MENU
echo ===================================================
echo.
echo [1] Create a new image (IMG or QCOW2)
echo [2] Convert from QCOW2 to RAW IMG
echo [3] Convert from RAW IMG to Compressed QCOW2
echo.
echo [0] Exit
echo.
echo ===================================================
echo.

choice /C:1230 /N /M "Enter your choice: "

if errorlevel 4 goto :Exit
if errorlevel 3 goto :CompressQcow2
if errorlevel 2 goto :ConvertQcow2ToImg
if errorlevel 1 goto :CreateImage

:CreateImage
cls
echo ===================================================
echo                 CREATE NEW IMAGE
echo ===================================================
echo.
echo [1] Create a RAW (.img) file
echo [2] Create a QCOW2 (.qcow2) file
echo.
echo [B] Back to Main Menu
echo ===================================================
echo.

choice /C:12B /N /M "Select format: "

if errorlevel 3 goto :MainMenu
if errorlevel 2 goto :MakeQcow2
if errorlevel 1 goto :MakeImg

:MakeImg
echo.
set /p "img_name=Enter image filename/path (e.g., win7.img): "
set /p "img_size=Enter size (e.g., 20G, 100G, 1T): "

:: Remove any existing quotes entered by user
set "img_name=%img_name:"=%"

:: Automatically append extension if missing
if /i not "!img_name:~-4!"==".img" set "img_name=!img_name!.img"

echo.
echo Processing...
qemu-img create -f raw "!img_name!" %img_size%
echo.
pause
goto :MainMenu

:MakeQcow2
echo.
set /p "qcow_name=Enter image filename/path (e.g., win7.qcow2): "
set /p "qcow_size=Enter size (e.g., 20G, 100G, 1T): "

:: Remove any existing quotes entered by user
set "qcow_name=%qcow_name:"=%"

:: Automatically append extension if missing
if /i not "!qcow_name:~-6!"==".qcow2" set "qcow_name=!qcow_name!.qcow2"

echo.
echo Processing...
qemu-img create -f qcow2 "!qcow_name!" %qcow_size%
echo.
pause
goto :MainMenu

:ConvertQcow2ToImg
cls
echo ===================================================
echo             CONVERT QCOW2 TO RAW IMG
echo ===================================================
echo.
set /p "src_qcow=Enter source QCOW2 filename/path: "
set /p "dest_img=Enter destination IMG filename/path: "

:: Remove any existing quotes entered by user
set "src_qcow=%src_qcow:"=%"
set "dest_img=%dest_img:"=%"

:: Automatically append extensions if missing
if /i not "!src_qcow:~-6!"==".qcow2" set "src_qcow=!src_qcow!.qcow2"
if /i not "!dest_img:~-4!"==".img" set "dest_img=!dest_img!.img"

echo.
echo Processing conversion...
qemu-img convert -f qcow2 -O raw "!src_qcow!" "!dest_img!"
echo.
pause
goto :MainMenu

:CompressQcow2
cls
echo ===================================================
echo          CONVERT IMG TO COMPRESSED QCOW2
echo ===================================================
echo.
set /p "src_img=Enter source IMG filename/path: "
set /p "dest_qcow=Enter destination QCOW2 filename/path: "

:: Remove any existing quotes entered by user
set "src_img=%src_img:"=%"
set "dest_qcow=%dest_qcow:"=%"

:: Automatically append extensions if missing
if /i not "!src_img:~-4!"==".img" set "src_img=!src_img!.img"
if /i not "!dest_qcow:~-6!"==".qcow2" set "dest_qcow=!dest_qcow!.qcow2"

echo.
echo Processing compression and conversion...
qemu-img convert -f raw -O qcow2 -c "!src_img!" "!dest_qcow!"
echo.
pause
goto :MainMenu

:Exit
echo Goodbye!
timeout /t 2 >nul
exit

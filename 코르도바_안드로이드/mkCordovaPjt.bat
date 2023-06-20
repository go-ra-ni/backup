@echo off
@echo CREATE CORDOVA HYBRID PROJECT FOR ANDROID

echo 프로젝트 명, 패키지경로, 메인클래스네임을 입력해 주세요.
echo 안드로이드 단말기를 개발자 모드 및 USB디버깅 활성화 후 연결해 주세요.
echo 윈도우 운영체제 전용입니다. C드라이브 루트에 프로젝트를 만듭니다. 
echo 관리자 권한모드로 CMD콘솔을 실행해야 합니다.
echo ----------------------------------------------------------  
echo projectName   : %1
echo packagePath   : %2
echo mainClassName : %3
echo ----------------------------------------------------------

pause

set projectName=%1
set packagePath=%2
set mainClassName=%3

cd /

echo ---------------cordova install----------------------------

call npm install -g cordova

call cordova create %projectName% %packagePath% %mainClassName%

cd %projectName%

call cordova platform add android@12.0.0
call cordova platform add browser
call cordova platform ls

echo ---------------install splashscreen-------------------------------
call cordova plugin add cordova-plugin-splashscreen

echo ---------------install camera------------------------------------
REM call cordova plugin add cordova-plugin-camera
call cordova plugin add https://github.com/OutSystems/cordova-plugin-camera#4.2.0-OS40
echo ---------------install plugin-file-------------------------------
call cordova plugin add cordova-plugin-file

echo ---------------install inappbrowser-------------------------------
call cordova plugin add cordova-plugin-inappbrowser

echo ---------------install geolocation--------------------------------
call cordova plugin add cordova-plugin-geolocation

echo ---------------install dialogs------------------------------------
call cordova plugin add cordova-plugin-dialogs

echo ---------------install screen-orientation-------------------------
call cordova plugin add cordova-plugin-screen-orientation

echo ---------------install screen-orientation-------------------------
call cordova plugin add cordova-plugin-android-permissions

echo ---------------install plugman------------------------------------
call npm install -g plugman

echo ---------------install mpmCommonPlugin--------------------

call plugman create --name mpmCommonPlugin --plugin_id cordova.plugin.mpmCommon --plugin_version 0.0.1

cd mpmCommonPlugin

call plugman platform add --platform_name android

call plugman createpackagejson .

cd ..

call cordova plugin add --link ./mpmCommonPlugin --verbose


echo ---------------launch cordova app-------------------------
echo ---------------launch cordova app-------------------------
echo ---------------launch cordova app-------------------------

call cordova run android



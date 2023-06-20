@echo off
@echo CREATE CORDOVA HYBRID PROJECT FOR ANDROID

echo ������Ʈ ��, ��Ű�����, ����Ŭ���������� �Է��� �ּ���.
echo �ȵ���̵� �ܸ��⸦ ������ ��� �� USB����� Ȱ��ȭ �� ������ �ּ���.
echo ������ �ü�� �����Դϴ�. C����̺� ��Ʈ�� ������Ʈ�� ����ϴ�. 
echo ������ ���Ѹ��� CMD�ܼ��� �����ؾ� �մϴ�.
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



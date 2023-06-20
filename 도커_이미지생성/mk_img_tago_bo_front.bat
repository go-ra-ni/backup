@echo off
color 1F
@echo CREATE DOCKER IMAGES FOR TAGO_FRONT

echo ������ Ÿ���� Ȯ���� �ּ���.
echo ��) stg , 1.0
echo target:%1
echo version:%2

pause


set target=%1
set version=%2

cd C:/workspace/mpm_bo_frontend
docker build --platform linux/amd64 -t tago_bo_front .



pause


docker image tag tago_bo_front:latest conatiners.ncr.gov-ntruss.com/tago_bo_front_%target%:%version%

docker images

pause

docker push conatiners.ncr.gov-ntruss.com/tago_bo_front_%target%:%version%

pause
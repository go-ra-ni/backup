@echo off
color 1F
@echo CREATE DOCKER IMAGES FOR TAGO_BO_BACK

echo 버전과 타겟을 확인해 주세요.
echo 예) stg , 1.0
echo target:%1
echo version:%2

pause


set target=%1
set version=%2

cd C:/mpm_bo_backend
docker build --platform linux/amd64 -t tago_bo_backend .



pause


docker image tag tago_bo_backend:latest conatiners.ncr.gov-ntruss.com/tago_bo_backend_%target%:%version%

docker images

pause

docker push conatiners.ncr.gov-ntruss.com/tago_bo_backend_%target%:%version%

pause
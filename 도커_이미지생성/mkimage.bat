@echo off
color 1F
@echo CREATE DOCKER IMAGES FOR TAGO_FRONT

echo 버전과 타겟을 확인해 주세요.
echo 예) 1.0 , stg
echo target:%1
echo version:%2

pause


set target=%1
set version=%2

cd c:/mpm_frontend
docker build --platform linux/amd64 -t tago_front .



pause


docker image tag tago_front:latest conatiners.ncr.gov-ntruss.com/tago_front_%target%:%version%


pause

docker push conatiners.ncr.gov-ntruss.com/tago_front_%target%:%version%
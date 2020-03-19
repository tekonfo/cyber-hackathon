#!/bin/s
set -ex
if [ -f /var/log/nginx/access.log ]; then
    mv /var/log/nginx/access.log /var/log/nginx/access.log.$(date +"%Y%m%d_%H%M%S")
fi
if [ -f /var/log/mysql/mysql-slow.log ]; then
    mv /var/log/mysql/mysql-slow.log /var/log/mysql/mysql-slow.log.$(date +"%Y%m%d_%H%M%S")
fi
systemctl daemon-reload
systemctl restart nginx.service
systemctl restart mysql.service
systemctl restart btc-go.service
sleep 10
HOST=${BTC_HOST:-http://127.0.0.1:8080}
curl ${HOST}/initialize
curl -XPOST ${HOST}/regist --data 'username=shibata&email=foo&password=foo' -c cookie.txt
curl -XGET -v -b cookie.txt -o /dev/null ${HOST}/
echo "Success to reload!"h

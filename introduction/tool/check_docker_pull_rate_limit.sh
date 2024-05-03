#!/bin/bash
# 2021.5.24 Mon Version 0.0.2 
#           強制安裝相關 RPM 套件
# 2021.3.22 Mon Version 0.0.1 Anderson Wang
#           檢查 docker 網站的 pull rate limit【下載限制】
rpm -q epel-release $> /dev/null || yum install epel-release -y
rpm -q jq &> /dev/null || yum install jq -y
TOKEN=$(curl "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
curl --head -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest

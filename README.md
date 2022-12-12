# v2ray-simple-script
simplest 1 step v2ray setup. v2ray一键脚本

## How to use
使用 ubuntu，centOS 需修改脚本防火墙部分
1. ssh to vps
2. run v2ray at port 9000 for example
```
apt-get install -y curl && bash <(curl -L https://raw.githubusercontent.com/melaniedxu/v2ray-simple-script/main/v2ray.sh)
```
3. use v2ray client (vmess) to connect

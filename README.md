# v2ray-tiktok-script v2ray tiktok一键脚本
simplest 1 step v2ray setup. v2ray一键脚本

## chain proxy

your ip -> VPS 
for non-tiktok req: direct connect
for tiktok req: proxy provider via socks5 -> connect

## What it's for
一种躲避屏蔽机房ip检测的解决方案，i.e. for Netflix, Tiktok. 具体链路见上。

连接 VPS 后一键设置双重代理，譬如用住户 ip 做二级代理：
```
curl --socks5 127.0.0.1:9001 https://ipinfo.io # inside vps
{
  "ip": "XXXX",
  "hostname": "XXXXX",
  "city": "XXXXX",
  "region": "Virginia",
  "country": "US",
  "loc": "XXXXXXX",
  "org": "Comcast Cable Communications, LLC", # residential IP
  "postal": "XXXX",
  "timezone": "America/New_York",
  "readme": "https://ipinfo.io/missingauth"
}
```

## How to use
使用 centOS 需修改脚本防火墙部分
1. ssh to vps
2. run v2ray at port 9000 for example
```
apt-get install -y curl && bash <(curl -L https://raw.githubusercontent.com/melaniedxu/v2ray-simple-script/main/v2ray.sh) $PORT_NUMBER $PROXY_ADDR $PROXY_PORT
```
3. use v2ray client (vmess) to connect

一键脚本设置:
* 双重代理
* 证书加密
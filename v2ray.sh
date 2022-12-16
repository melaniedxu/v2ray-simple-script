#!/bin/bash

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 3 ] || die "3 argument(port_number, proxy_addr, proxy_port) required, $# provided"

bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)

uuid=$(/usr/local/bin/v2ray uuid)
echo "init v2ray with --port=$1 --uuid=$uuid"
mkdir -p /var/log/v2ray/
touch /var/log/v2ray/access.log
touch /var/log/v2ray/error.log

cat > /usr/local/etc/v2ray/config.json << EOF
{
  "log": {
    "loglevel": "warning",
    "access": "/var/log/v2ray/access.log",
    "error": "/var/log/v2ray/error.log"
  },
  "inbounds": [{
    "port": $1,
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "$uuid"
        }
      ]
    },
    "sniffing": {
      "enabled": true,
      "destOverride": ["http", "tls"]
    }
  },{
    "tag": "socks",
    "port": 9001,
    "protocol": "socks",
    "sniffing": {
      "enabled": true,
      "destOverride": [
        "http",
        "tls"
      ]
    },
    "settings": {
      "auth": "noauth",
      "udp": true,
      "allowTransparent": false
    }
  },{
      "port": 9002,
      "protocol": "http",
      "sniffing": {
        "enabled": true,
        "destOverride": ["http", "tls"]
      },
      "settings": {
        "auth": "noauth",
        "udp": false
      }
    }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  },{
  "protocol": "socks",
  "settings": {
   "servers": [{
    "address": "$2",
    "port": $3
   }]
  },
  "tag": "streaming"
 }],
  "dns": {
    "servers": [
      "https+local://dns.google/dns-query",
      "8.8.8.8",
      "1.1.1.1",
      "localhost"
    ]
  },
 "routing": {
   "domainStrategy": "IPIfNonMatch",
   "rules": [
     {
       "type": "field",
       "domain": [
          "domain:tiktok.com",
          "domain:tiktok.org",
          "domain:tiktokcdn.com",
          "domain:tiktokv.com",
          "domain:muscdn.com",
          "domain:musical.ly",
          "domain:musically.ly",
          "domain:bytedance.com",
          "domain:ibytedtos.com",
          "domain:byteoversea.com",
          "domain:byteoversea.net",
          "domain:ibytedtos.com",
          "domain:musemuse.cn",
          "domain:muscdn.com.akamaized.net",
          "domain:tiktok.com.edgesuite.net",
          "domain:tiktokcdn.com.akamaized.net",
          "domain:tiktokcdn.com.c.worldfcdn.com",
          "domain:tiktokcdn.com.edgesuite.net",
          "domain:tiktokcdn.com.wsdvs.com",
          "domain:tiktokcdn.liveplay.myqcloud.com",
          "domain:tiktokv.com.edgekey.net",
          "domain:tiktokv.com.edgesuite.net",
          "domain:p16-tiktokcdn-com.akamaized.net",
          "domain:v16-tiktokcdn-com.akamaized.net",
          "domain:mon.byteoversea.com",
          "domain:mon-va.byteoversea.com",
          "domain:abtest-va-tiktok.byteoversea.com",
          "domain:p16.hypstarcdn.com",
          "domain:sf-tb-sg.ibytedtos.com",
          "domain:xlog-va.byteoversea.com",
          "domain:dm-maliva16.byteoversea.com",
          "domain:dm.bytedance.com",
          "domain:sgali3.l.byteoversea.net",
          "domain:tiktokcdn-com.akamaized.net",
          "domain:api-h2.tiktokv.com",
          "domain:api21-h2.tiktokv.com",
          "domain:ns-440.awsdns-55.com",
          "domain:ns-722.awsdns-26.net",
          "domain:ns-1475.awsdns-56.org",
          "domain:ns-1574.awsdns-04.co.uk",
          "domain:m.tiktok.com",
          "domain:t.tiktok.com",
          "domain:v19.tiktokcdn.com",
          "domain:v16.tiktokcdn.com",
          "domain:api.tiktokv.com",
          "domain:mon.tiktokv.com",
          "domain:ib.tiktokv.com",
          "domain:isnssdk.com",
          "domain:toutiaocdn.net",
          "domain:gshifen.com",
          "domain:ttoversea.net",
          "domain:jomodns.com",
          "domain:wshifen.com",
          "domain:bytedns.net",
          "domain:douyincdn.com",
          "domain:snssdk.com",
          "domain:tbsandbox.com",
          "domain:mzfvozqybf.com",
          "domain:taobao.net",
          "domain:kunlunle.com",
          "domain:hypstarcdn.com",
          "domain:qfyf1toi.com",
          "domain:bytedance.net",
          "domain:bitgravity.com",
          "domain:dnsv1.com",
          "domain:sgsnssdk.com",
          "domain:amap.com",
          "domain:akamaihd.net",
          "domain:xzcs3zlph.com",
          "domain:ks-cdn.com",
          "domain:bsgslb.cn",
          "domain:youdianyisi.com",
          "domain:wsdvs.com",
          "domain:cloudfront.net",
          "domain:atomile.com",
          "domain:amemv.com",
          "domain:rocket-cdn.com",
          "domain:ctobsnssdk.com",
          "domain:neihanshequ.com",
          "domain:tlivecdn.com",
          "domain:musical.ly.lan",
          "domain:pitaya-clientai.com",
          "domain:footprint.net",
          "domain:ixigua.com",
          "domain:bytexservice.com",
          "domain:cdnle.com",
          "domain:edgesuite.net",
          "domain:kunlungr.com",
          "domain:cloudflare.net",
          "domain:bytelb.com",
          "domain:ibyteimg.com",
          "domain:app-measurement.com",
          "domain:tiktokcdn-us.com",
          "domain:zwtianshangm.com",
          "domain:fastly.net",
          "domain:cdntip.com",
          "domain:bdgslb.com",
          "domain:myqcloud.com",
          "domain:bdurl.net",
          "domain:bytetcdn.com",
          "domain:awsdns-56.org",
          "domain:kunlunpi.com",
          "domain:alikunlun.net",
          "domain:alikunlun.com",
          "domain:akamai.net",
          "domain:bytedance-tmcdn.tm.com.my",
          "domain:byteimg.com",
          "domain:cdngslb.com",
          "domain:sgpstatp.com",
          "domain:baishan-cloud.net",
          "domain:douyinact.com",
          "domain:ovscdns.net",
          "domain:cloudcdn.net",
          "domain:kunlunca.com",
          "domain:iesdouyin.com",
          "domain:pstatp.com",
          "domain:tiktokd.org",
          "domain:sgnssdk.com",
          "domain:juliangyinqing.com",
          "domain:edgekey.net",
          "domain:kunlunhuf.com",
          "domain:tiktokcdn-in.com",
          "domain:ipstatp.com",
          "domain:douyinvideo.net",
          "domain:akamaized.net",
          "domain:zjurl.cn",
          "domain:bytedanceapi.com",
          "domain:kunluncan.com",
          "domain:aliyuncs.com",
          "domain:cloudglb.com",
          "domain:onelink.me",
          "domain:ttoverseaus.net",
          "domain:awsdns-55.com",
          "domain:umeng.com",
          "domain:byted.org",
          "domain:wscdns.com",
          "domain:worldfcdn2.com",
          "domain:toutiaocloud.com",
          "domain:taobao.com",
          "domain:bytecdn.cn",
          "domain:app.link",
          "domain:toutiao.com",
          "domain:kunlunsl.com",
          "domain:topbuzz.com",
          "domain:srip.net",
          "domain:bytedapm.com",
          "domain:toutiaocdn.com",
          "domain:worldfcdn.com",
          "domain:com.localdomain",
          "domain:jinritemai.com",
          "domain:bytefcdn-oversea.com",
          "domain:amazonaws.com",
          "domain:liteshopads.com",
          "domain:jcloudcdn.com",
          "domain:byteicdn.com",
          "domain:wsglb0.com",
          "domain:awsdns-04.co.uk",
          "domain:akadns.net",
          "domain:bsgslb.com",
          "domain:cmbchina.com",
          "domain:douyin.com",
          "domain:awsdns-26.net",
          "domain:ks-cdn1.com",
          "domain:toutiaocloud.net",
          "domain:chengzijianzhan.com",
          "domain:ulikecam.com",
          "domain:ixiguavideo.com",
          "domain:toutiao50.com",
          "domain:ttlivecdn.com",
          "domain:cdnvideo.ru",
          "domain:ixugua.com",
          "domain:ksyuncdn.com",
          "domain:toutiaocdn.cn",
          "domain:ipaddress.com",
          "domain:ipinfo.io"
        ],
       "outboundTag": "streaming"
      },
      {
       "type": "field",
       "ip": [
          "161.117.71.74",
          "47.252.102.182",
          "161.117.71.35",
          "161.117.70.89",
          "161.117.70.145",
          "161.117.70.136",
          "47.252.50.101",
          "47.252.102.193",
          "161.117.71.34",
          "161.117.71.73",
          "47.252.102.48",
          "47.252.50.157",
          "34.196.79.125",
          "47.252.102.198",
          "161.117.70.68"
        ],
       "outboundTag": "streaming"
      }
    ]
  }
}
EOF

ufw allow $1/tcp

systemctl enable v2ray
systemctl start v2ray
echo "finished setup v2ray at port $1"
systemctl status v2ray
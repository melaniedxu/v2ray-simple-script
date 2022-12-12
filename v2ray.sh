#!/bin/bash

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "1 argument(port number) required, $# provided"

bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)

uuid=$(/usr/local/bin/v2ray uuid)
echo "init v2ray with --port=$1 --uuid=$uuid"

cat > /usr/local/etc/v2ray/config.json << EOF
{
  "inbounds": [{
    "port": $1,
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "$uuid"
        }
      ]
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  }]
}
EOF

ufw allow $1/tcp

systemctl enable v2ray
systemctl start v2ray
echo "finished setup v2ray at port $1"
systemctl status v2ray
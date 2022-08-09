mkdir -p ./geodata
curl -LJ https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat -o ./geodata/geoip.dat
curl -LJ https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat.sha256sum -o ./geodata/geoip.dat.sha256sum
curl -LJ https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat.sha256sum -o ./geodata/geosite.dat.sha256sum
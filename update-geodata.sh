mkdir -p ./geodata
cd geodata
curl -LJO https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat
curl -LJO https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat.sha256sum
curl -LJO https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat
curl -LJO https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat.sha256sum

shasum -a 256 -c geoip.dat.sha256sum
shasum -a 256 -c geosite.dat.sha256sum
cd ..

curl -s "https://api.github.com/repos/IrineSistiana/mosdns/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g' | awk '{print "export TAG="$1}' > .env

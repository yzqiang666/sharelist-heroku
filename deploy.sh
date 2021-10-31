apk add --update openssl

cd /app

#wget https://github.com/justhy/sharelist/archive/master.zip -O sharelist.zip
wget https://github.com/reruin/sharelist/archive/master.zip -O sharelist.zip
unzip sharelist.zip

cd /app/sharelist-master
npm install
mkdir -p /app/sharelist-master/cache
if echo "$CONFIG" | grep -q -i "^http"; then
  wget --no-check-certificate $CONFIG -O /app/sharelist-master/cache/config.json
else
  echo -e "$CONFIG" > /app/sharelist-master/cache/config.json
fi
cat /app/sharelist-master/cache/config.json
npm start

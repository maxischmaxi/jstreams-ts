npm ci

if [ -d "./jstreams-server" ]; then
  rm -rf jstreams-server
fi

git clone https://github.com/maxischmaxi/jstreams-server.git

if [ -d "./protos" ]; then
  rm -rf protos
  mkdir protos
else
  mkdir protos
fi

mv jstreams-server/protos/*.proto protos/

rm -rf jstreams-server

npx buf generate

git add .

git commit -m "Update protos"

git push -u origin main

npm publish

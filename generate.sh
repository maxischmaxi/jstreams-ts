npm ci

find . -type f \( -name "*.js" -o -name "*.d.ts" \) -not -path "./node_modules/*" -exec rm -v {} \;

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

if [ ! -f package.json ]; then
  echo "package.json nicht gefunden!"
  exit 1
fi

current_version=$(grep '"version"' package.json | sed -E 's/.*"([0-9]+\.[0-9]+\.[0-9]+)".*/\1/')

if [ -z "$current_version" ]; then
  echo "Version konnte nicht gefunden werden!"
  exit 1
fi

IFS='.' read -r -a version_parts <<< "$current_version"
new_patch=$((version_parts[2] + 1))
new_version="${version_parts[0]}.${version_parts[1]}.$new_patch"
sed -i '' "s/\"version\": \"$current_version\"/\"version\": \"$new_version\"/" package.json

rm -rf protos

git add .

git commit -m "Update protos"

git push -u origin main

npm publish

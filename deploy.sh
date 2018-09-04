ver=$(sed -n "s|^version=||p" module.prop)
name=$(sed -n "s|^name=||p" module.prop | sed -r "s| |-|g")
zip -r $name-$ver.zip . -x ".git/*" "LICENSE" "deploy.sh" ".gitignore" "*.zip"

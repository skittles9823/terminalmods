ver=$(grep -E "versionCode" module.prop | sed -r "s/versionCode=//")
zip -r Terminal-Modifications-$ver.zip . -x ".git/*" "LICENSE" "deploy.sh" ".gitignore"
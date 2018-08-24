ver=$(grep -E "version=" module.prop | sed -r "s/version=//")
zip -r Terminal-Modifications-$ver.zip . -x ".git/*" "LICENSE" "deploy.sh" ".gitignore" "*.zip"
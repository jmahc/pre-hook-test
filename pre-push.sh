#!/bin/sh
# husky

# Hook created by Husky
#   Version: 1.3.1
#   At: 4/18/2019, 1:56:11 PM
#   See: https://github.com/typicode/husky#readme

# From npm package
#   Name: husky
#   Directory: /Users/jordanmcardle/code/source-work/processxmlservice/node_modules/husky
#   Homepage: https://sgithub.com/typicode/husky#readme

scriptPath="node_modules/husky/run.js"
hookName=`basename "$0"`
gitParams="$*"

debug() {
  [ "${HUSKY_DEBUG}" = "true" ] && echo "husky:debug $1"
}

debug "$hookName hook started..."

if ! command -v node >/dev/null 2>&1; then
  echo "Can't find node in PATH, trying to find a node binary on your system"
fi

if [ -f "$scriptPath" ]; then
  # if [ -t 1 ]; then
  #   exec < /dev/tty
  # fi
  if [ -f ~/.huskyrc ]; then
    debug "source ~/.huskyrc"
    source ~/.huskyrc
  fi
  npx run-node/run-node "$scriptPath" $hookName "$gitParams"
else
  echo "Can't find Husky, skipping $hookName hook"
  echo "You can reinstall it using 'npm install husky --save-dev' or delete this hook"
fi

npx -p husky -p run-node -- $(npx husky run.js)


# Polish up Husky NPX script
# incoopoae Jenknis akonside a worting plant s
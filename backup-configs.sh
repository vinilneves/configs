#! /bin/bash

date=$(date -d now '+%d-%m-%y')

rm ./.vimrc ./.zshrc

(
  git checkout -b auto-$date &> /dev/null
)

git checkout -f auto-$date

cp ~/.vimrc ./
cp ~/.zshrc ./

git add . && git commit -m "Salvamento automático"

$(git push 2>&1 | grep 'git push --set-upstream')

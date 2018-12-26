#! /bin/bash

rm -rf .vimrc .zshrc

(
  git checkout -b auto &> /dev/null
)

git checkout -f auto

cp ~/.vimrc ./
cp ~/.zshrc ./

git add . && git commit -m "Salvamento automático"

$(git push 2>&1 >/dev/null | grep 'git push')

#!/bin/bash
set -o nounset

cat >>.vimrc<<EOF
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'
set foldlevelstart=20
set number
EOF

# Install yamllint python package. Right now just för debian-based distros
sudo apt install yamllint

mkdir ~/config
mkdir ~/.config/yamllint

cat >>~/.config/yamllint/config<<EOF
extends: relaxed

rules:
  line-length: disable
EOF

#Install ALE 
mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale

# Modify Ale configuration
cat >>.vimrc<<EOF
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
EOF

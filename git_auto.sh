#!/bin/bash

# git_auto.sh — automatiza add, commit, pull-rebase e push com mensagem automática

set -e

echo "=============================="
echo " Iniciando Git Auto-Update  "
echo "=============================="

# 1) Verifica alterações
if [[ -z $(git status --porcelain) ]]; then
  echo "Nenhuma alteração detectada. Saindo."
  exit 0
fi

# 2) Stage de todas as mudanças (inclui untracked, modificações e deleções)
git add -A
echo "✔️  Todas as mudanças foram staged."

# 3) Mensagem de commit automática com timestamp e lista de arquivos
files=$(git diff --cached --name-only | tr '\n' ' ')
msg="Auto-update $(date +'%Y-%m-%d %H:%M:%S') - files: $files"

# 4) Commit
git commit -m "$msg"
echo "✔️  Commit criado: $msg"

# 5) Descobre a branch atual
branch=$(git rev-parse --abbrev-ref HEAD)
echo "✔️  Branch atual: $branch"

# 6) Pull com rebase
echo "🔄  Atualizando remoto (git pull --rebase origin $branch)…"
git pull --rebase origin "$branch"

# 7) Push
echo "🚀  Enviando para o GitHub (git push origin $branch)…"
git push origin "$branch"

echo "✅  Tudo concluído com sucesso!"


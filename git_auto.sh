#!/bin/bash

# git_auto.sh — automatiza add, commit, pull-rebase e push

set -e

echo "=============================="
echo " Iniciando Git Auto-Update  "
echo "=============================="

# 1) Detecta alterações (modified, deleted e untracked)
if [[ -z $(git status --porcelain) ]]; then
  echo "Nenhuma alteração detectada. Saindo."
  exit 0
fi

# 2) Solicita mensagem de commit
read -p "Mensagem de commit: " msg

# 3) Stage de todas as mudanças (inclui untracked, modifications e deletions)
git add -A
echo "✔️  Todas as mudanças foram staged."

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


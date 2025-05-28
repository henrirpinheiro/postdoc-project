#!/bin/bash

echo "====================="
echo " Git Auto-Update "
echo "====================="

read -p "Digite os nomes dos arquivos a adicionar (separados por espaço): " arquivos

# Verifica se os arquivos existem (permite arquivos novos)
for arquivo in $arquivos; do
    if [[ ! -e "$arquivo" ]]; then
        echo "Erro: Arquivo '$arquivo' não encontrado."
        exit 1
    fi
done

git add $arquivos
echo "Arquivos adicionados: $arquivos"

git commit -m "Atualização automática"
echo "Commit realizado."

# Obtém a branch atual de forma compatível
branch=$(git rev-parse --abbrev-ref HEAD)
echo "Branch atual: $branch"

git push origin "$branch"
echo "Push concluído com sucesso!"


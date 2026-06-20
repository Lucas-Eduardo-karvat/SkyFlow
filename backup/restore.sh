#!/bin/bash

sudo -u postgres psql -d skyflow_db < backup_skyflow.sql

if [ $? -eq 0 ]; then
    echo "Banco restaurado com sucesso!"
else
    echo "Erro ao restaurar o banco!"
fi
# Dar permissão: chmod +x restore.sh
# pa Executar: ./restore.sh
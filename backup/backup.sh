#!/bin/bash

sudo -u postgres pg_dump -d skyflow_db > backup_skyflow.sql

if [ $? -eq 0 ]; then
    echo "Backup realizado com sucesso!"
else
    echo "Erro ao realizar backup!"
fi
# para dar permisao "chmod +x backup.sh"
#para executar é so fazer "./backup.sh"
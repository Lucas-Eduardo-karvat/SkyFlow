#!/bin/bash

pg_dump -U postgres -d skyflow_db > backup_skyflow.sql

echo "Backup realizado com sucesso!"
# para dar permisao "chmod +x backup.sh"
#para executar é so fazer "./backup.sh"
#!/bin/bash

psql -U postgres -d skyflow_db < backup_skyflow.sql

echo "Banco restaurado com sucesso!"
#precisa dar permisaao "chmod +x restore.sh"
# ./restore.sh esse é pra restuarar o banco de dados    
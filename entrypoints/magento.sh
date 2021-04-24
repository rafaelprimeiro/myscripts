#!/usr/bin/env bash

if test -f "composer.json"; then
    
else 
    composer create-project --repository-url=https://${public_key}:${private_key}@repo.magento.com/ magento/project-community-edition=2.4.2 . \
    && bin/magento setup:install \
    --base-url="${base_url}" \
    --db-host="${db_host}" \
    --db-name="${db_name}" \
    --db-user="${db_user}" \
    --db-password="${db_password}" \
    --admin-firstname="${admin_firstname}" \
    --admin-lastname="${admin_lastname}" \
    --admin-email="${admin_email}" \
    --admin-user="${admin_user}" \
    --admin-password="${admin_password}" \
    --language=pt_BR \
    --currency=BRL \
    --timezone=America/Sao_Paulo \
    --use-rewrites=1 \
    --search-engine="${search_engine}" \
    --elasticsearch-host="${elasticsearch_host}" \
    --elasticsearch-port="${elasticsearch_port}"
fi
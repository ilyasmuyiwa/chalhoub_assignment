# Dockerized Magento 2

## Prerequisite
Need Docker install in your machine (https://docs.docker.com/get-docker/)

Please follow below steps to up and run Magento 2 (2.4.1-p1) using Docker.

1. Download Magento 2.4.1-p1 from below location
`https://github.com/magento/magento2/archive/2.4.1-p1.tar.gz`
2. Extract files to `src/magento2-2.4.1-p1` directory.
3. Update your host file with below entry.
    `127.0.0.1 www.magento-dev.com`
4. Open your terminal and change working directory to project root directory.
5. Run `docker-compose up -d`.
6. Run `docker exec -it magentoApp bash` to connect to the magento2 container.
7. Run `composer install`
8. Change folder to `bin` by executing `cd bin`
9. Execute below command.
   ````
   ./magento setup:install \
    --base-url=http://www.magento-dev.com/ \
    --db-host=db \
    --db-name=appDB \
    --db-user=root \
    --db-password=hello123 \
    --admin-firstname=admin \
    --admin-lastname=admin \
    --admin-email=admin@admin.com \
    --admin-user=admin \
    --admin-password=admin123 \
    --language=en_US \
    --currency=USD \
    --timezone=America/Chicago \
    --use-rewrites=1 \
    --search-engine=elasticsearch7 \
    --elasticsearch-host=es \
    --elasticsearch-port=9200
   ````
10. Open your browser and navigate to `www.magento-dev.com`

## Note

If you are using Apple Silicon Chip you can use this setup without any issue. If you are using Intel Chip please follow docker-compose.yml file comments.
# chalhoub_assignment

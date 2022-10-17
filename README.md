# Case Study - Magento 2.4 - Shopfinder GraphQL

## Prerequisite
Need Docker install in your machine (https://docs.docker.com/get-docker/)

### Note: Magento is already installed 

Please follow below steps to up and run the project.

1. Clone the repository
2. Go to chalhoub project folder -> cd chalhoub
3. Update your host file to magento.local
4. Open your terminal and change working directory to project root directory.
5. Run `docker-compose up -d`.
6. Open your browser and navigate to magento.local
   ```
   admin_url : magento.local/admin
   admin_username: admin
   admin_password: admin123
   mysql_username: magento
   mysql_password: magento
   ```

## To install ShopFinder Module

1. cd to appdata
2. Run composer require chalhoub/module-shopfinder
3. Connect to PHP container by running `docker exec -it chalhoub_phpfpm_1` bash.
4. Run deployment commands
   ```
    bin/magento setup:upgrade
    bin/magento setup:di:compile
    bin/magento c:f
   ```
   
## GraphQl Sample Request 
  ### Endpoint -> https://magento2.local/graphql
  
 - To fetch all the shops
    ```
    {
       fetchShop(
        pageSize: 10
        currentPage: 1
      ) {
        total_count
        items {
          shop_name
          Identifier
          Country
          Image
        }
      }
    }
    ```

- To fetch a single Shop using Identifier
   ```
    {
      fetchShop(
        filter: { Identifier: { like: "test" } }
        pageSize: 10
        currentPage: 1
      ) {
        total_count
        items {
          shop_name
          Identifier
          Country
          Image
        }
      }
    }
    
    ```
 - To Update Shop
   ```
   mutation {
    updateShop(
        id: 2,  
        input: {
          shop_name: "Chalhoub Store"
          Identifier: "new-identifier"
        }
      ) {
        shop {
          shop_name
          Identifier
        }
      }
   }
   
   ``` 
 - To Create Shop
   ```
   mutation {
      createShop(
        input: {
          shop_name: "Ilyas big Store"
          Identifier: "snicestftssss"
          Country: "AQ"
          Image: "test.png"

        }
      ) {
        shop {
          shop_name
        }
      }
   }

   ``` 
 - To delete a Shop
  
  ```
  mutation {
  deleteShop(id: 2)
  } 
  ```  
   





   

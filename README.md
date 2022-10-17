# Case Study - Magento 2.4 - Shopfinder GraphQL

## Prerequisite
Need Docker install in your machine (https://docs.docker.com/get-docker/)

##### Note: Fresh Magento 2.4.3-p1 with sample data is already installed 

Please follow below steps to up and run the project.

1. Clone the repository
2. Open your terminal and change directory to chalhoub project folder -> `cd chalhoub`
3. Update your host file to magento.local
4. Run `docker-compose up -d`.
5. Open your browser and navigate to magento.local
   ```
   admin_url : magento.local/admin
   admin_username: admin
   admin_password: admin123
   mysql_username: magento
   mysql_password: magento
   ```

## To install ShopFinder Module

1. Connect to PHP container by running `docker exec -it chalhoub_phpfpm_1 bash`.
2. Run composer require chalhoub/module-shopfinder
3. Run deployment commands
   ```
    bin/magento setup:upgrade
    bin/magento setup:di:compile
    bin/magento c:f
   ```
   
## GraphQl Sample Request 
  ### Endpoint -> https://magento.local/graphql
  
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
        id: 1,  
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
          Identifier: "snicest"
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
  deleteShop(id: 1)
  } 
  ```  

#### -.




   

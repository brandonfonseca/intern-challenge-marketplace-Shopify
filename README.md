
# Installation Instructions

1. Ensure your Rails version is >= 5.2.2 and your Ruby version is >= 2.5.1
2. Navigate to where you would like to install the project on your computer and use `mkdir intern-challenge-marketplace-Shopify` to make a folder
3. Navigate to the newly created folder using `cd intern-challenge-marketplace-Shopify`
4. Clone this repository into the folder using `git clone [SSH or HTTPS github cloning link]`
5. PostgreSQL is used as the primary database for this application. Please ensure PostgreSQL is installed on your machine. If it is not please install it using the following tutorials:

MacOS: `https://medium.com/@Umesh_Kafle/postgresql-and-postgis-installation-in-mac-os-87fa98a6814d`

Ubuntu: `https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04`

6. In the application directory run `rake db:create` to create the database

7. Now run `rake db:migrate` to create the necessary tables. 

8. In order to seed the database with default mock data (used for testing the application) run `rake db:seed`

9. Now we are ready to start the rails server. Run `rails s` to start the server on the default port (which is usually port 3000). If you would like to specify the port use `rails s -p [port number here]`

10. Now that our API is running, we need a method to query this API. This can be done many ways (including cURL requests, using a browser, or a dedicated application). If you are using MacOS or Ubuntu I suggest you download `Postman` as it provides a nice GUI for API requests.

11. That completes the setup! To learn how to use this application, please see the "Usage Guide" section of this README

# Usage Guide

The purpose of this application is to simulate the backend of an online shopping experience. Using this API one can view a list of inventory, create a cart, and purchase products in the cart. 



**Viewing inventory:**

1. To view a JSON list of inventory (including items with zero stock) use the following GET request `http://127.0.0.1:3000/api/v1/show` (ensure that the "3000" in the URL is replaced with the port number you specifed when running the local Rails server)

2. To view a JSON list of inventory (excluding items with zero stock) use the following GET request `http://127.0.0.1:3000/api/v1/show?instock=true` (ensure that the "3000" in the URL is replaced with the port number you specifed when running the local Rails server)


**Creating a cart and purchasing products:**

1. To create a new cart use the following GET request `http://127.0.0.1:3000/api/v1/newcart`

2. To add an item to your cart use the following GET request: `http://127.0.0.1:3000/api/v1/add?name=Kitkat+bar&quantity=5`
     
     - In the URL enter the name of the product you wish to add to your cart in the `name` argument (if the name has a space ensure you           use a "+" between the words)
     - In the URL enter the quantity of the product you wish to add to your cart in the `quantity` argument
     
     - If an invalid name or quantity is requested the API will not allow you to add the item to the cart, and will return the appropriate        error message
     
3. To view your current cart use the following GET request: `http://127.0.0.1:3000/api/v1/viewcart`

4. To checkout the items in your cart use the following GET request: `http://127.0.0.1:3000/api/v1/checkout`. Checking out your cart will reduce the inventory count by the specified quantity


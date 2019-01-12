# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Installation Instructions

1. Ensure your Rails version is >= 5.2.2 and your Ruby version is >= 2.5.1
2. Navigate to where you would like to install the project on your computer and use `mkdir intern-challenge-marketplace-Shopify` to make a folder
3. Navigate to the newly created folder using `cd intern-challenge-marketplace-Shopify`
4. Clone this repository into the folder using `git clone [SSH or HTTPS github cloning link]`
5. PostgreSQL is used as the primary database for this application. Please ensure PostgreSQL is installed on your machine. If it is not please install it using the following tutorials:

MacOS `https://medium.com/@Umesh_Kafle/postgresql-and-postgis-installation-in-mac-os-87fa98a6814d`

Ubuntu `https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04`
6. In the application directory run `rake db:create` to create the database
7. Now run `rake db:migrate` to create the necessary tables. 
8. In order to seed the database with default mock data (used for testing the application) run `rake db:seed`
9. Now we are ready to start the rails server. Run `rails s` to start the server on the default port (which is usually port 3000). If you would like to specify the port use `rails s -p [port number here]`
10. That completes the setup! To learn how to use this application, please see the "Usage Guide" section of this README

# Usage Guide

The purpose of this application is to simulate the backend of an online shopping experience. Using this API one can 


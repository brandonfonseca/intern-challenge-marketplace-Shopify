module Api::V1
  class ProductsController < ApplicationController

#returns a JSON of either a single product or a list of products. If the user requests to see an entire list of products, they can specify if they only  want to see products that are in stock
    def show
      stocked_products_only = params["instock"]
      name = params["name"]
      if name.present?
        @products = Product.find_by(title: name)
        @products = {"Error": "Product with that name was not found in our database"} if @products.nil?
      elsif stocked_products_only == "true"
        @products = Product.where("inventory_count > 0")
      else
        @products = Product.all
      end
      @products = {"Error": "No products to display"} if @products == []
      render json: @products
    end

    def purchase
      name = params["name"]
      if name.nil?
        @product = {"Error": "Product name must be specified"}
      else
        #name.capitalize!
        @product = Product.find_by(title: name)
        if @product.nil?
          @product = {"Error": "Product with that name was not found in our database"}
        else
          quantity = @product.inventory_count
          if quantity <= 0
            @product = {"Error": "Product out of stock"}
          else
            @product.update_columns(inventory_count: quantity - 1)
          end
        end
      end
      render json: @product
    end

  end
end
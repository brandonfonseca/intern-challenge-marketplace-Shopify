module Api::V1
  class ShoppingController < ApplicationController

    #returns a JSON of either a single product or a list of products. If the user requests to see an entire list of products, they can specify if they only  want to see products that are in stock
    def show
      stocked_products_only = params["instock"]
      name = params["name"]
      name.capitalize! if name.present?
      if name.present? || name == ""
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

    #Allows the user to add a product to their cart. If the name or quantity of the product they are interested in is invalid, the appropriate error message is returned, and the item is not added to their cart
    def add_product_to_cart
      name = params["name"].to_s
      quantity = params["quantity"].to_s
      if name.empty? || quantity.empty?
        @product = {"Error": "Product name must be specified"} if name.empty?
        @product = {"Error": "Quantity must be specified"} if quantity.empty?
        @product = {"Error": "Name and quantity must be specified"} if name.empty? && quantity.empty?
      else
        name.capitalize!
        @product = Product.find_by(title: name)
        if @product.nil?
          @product = {"Error": "Product with that name was not found in our database"}
        else
          stock = @product.inventory_count
          if stock <= quantity.to_i
            @product = {"Error": "Not enough stock"}
            @product = {"Error": "No stock left for this item"} if stock == 0
          else
            if Cart.find_by(product_id: @product.id).nil?
              Cart.create(product_id: @product.id, quantity: quantity)
              @product = {"Message": "Item successfully added to cart!"}
            else
              @product = {"Error": "This item is already in your cart"}
            end
          end
        end
      end
      render json: @product
    end

    def create_cart #Initializes a cart
      cart = Cart.destroy_all
      render json: {"Message": "New cart created, happy shopping!"}
    end

    def view_cart #Allows a user to view the items in their cart, and the total cost of the items in the cart
      cart = []
      @total = 0
      Cart.all.each do |item|
        product = Product.find(item.product_id)
        subtotal = item.quantity * product.price
        @total += subtotal
        cart.append({"Name": product.title,
                    "Quantity": item.quantity,
                    "Subtotal": subtotal.round(2)})
      end
      total = 0
      cart.append({"Total": "$#{@total.round(2)}"})
      render json: cart
    end

    def checkout #Allows the user to checkout their cart, thus reducing the inventory_count for the specified products
      Cart.all.each do |item|
        product = Product.find(item.product_id)
        product.update_columns(inventory_count: product.inventory_count - item.quantity)
      end
      cart = Cart.destroy_all
      render json: {"Message": "Checkout complete! Thanks for shopping with us!"}
    end

  end
end
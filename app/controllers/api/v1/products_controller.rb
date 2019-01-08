module Api::V1
  class ProductsController < ApplicationController
    def index
      @products = Product.all
      render json: @products
    end

    def show_all
      stocked_products_only = params["instock"]
      if stocked_products_only == "true"
        @products = Product.where("inventory_count > 0")
      else
        @products = Product.all
      end
      render json: @products
    end

  end
end
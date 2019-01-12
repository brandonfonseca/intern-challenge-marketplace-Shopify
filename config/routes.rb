Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "show", to: "shopping#show"
      get "newcart", to: "shopping#create_cart"
      get "add", to: "shopping#add_product_to_cart"
      get "viewcart", to: "shopping#view_cart"
      get "checkout", to: "shopping#checkout"
    end
  end
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "show", to: "products#show"
      get "purchase", to: "products#purchase"
    end
  end
end

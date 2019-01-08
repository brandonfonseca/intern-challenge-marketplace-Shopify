Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "show", to: "products#show_all"
    end
  end
end

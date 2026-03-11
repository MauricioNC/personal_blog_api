Rails.application.routes.draw do
  resources :posts do
    get "/tag/:tag", on: :collection, to: "posts#tag", as: :tag
  end
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#  resources :items, only: :index
root 'items#index'
resources :items do
 resources :purchase_records,only:[:index,:new,:create]
end
resources :address

end

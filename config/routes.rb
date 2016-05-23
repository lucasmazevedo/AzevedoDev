Rails.application.routes.draw  do

  root 'welcome#index'
  #   get 'products/:id' => 'catalog#view'
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  devise_for :users


  namespace :admin do
    resources :clients
    resources :works
    resources :categories
    root :to => "welcome#index"
  end
  #
  # get '/trabalhos' => 'work#index', as: :works
  # get '/trabalhos/edit/:id' => 'work#edit', as: :edit_work
  # get '/trabalhos/new' => 'work#new', as: :new_work
  # patch '/trabalhos/update/:id' => 'work#update', as: :update_work
  # post '/trabalhos/create' => 'work#create', as: :create_work
  # get '/trabalhos/:id' => 'work#show', as: :work
  # delete '/trabalhos/:id' => 'work#destroy', as: :delete_work



  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

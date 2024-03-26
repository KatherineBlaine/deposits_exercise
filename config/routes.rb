Rails.application.routes.draw do
  
  resources :tradelines do
    resources :deposits, only: [:index, :create, :show]
  end

end

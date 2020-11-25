Rails.application.routes.draw do
  root 'home#index'
  get 'dashboard/index'
  devise_for :users
  scope '/dashboard' do
    resources :sources
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

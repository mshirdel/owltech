Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  scope '/dashboard' do
    resources :sources
    get '/articles' => "dashboard#articles"
    get '/articles/:id', to: "dashboard#article_details" , as: "details"
    get '/index' => "dashboard#index"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

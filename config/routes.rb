Rails.application.routes.draw do
  resources :decks do
    resources :cards
    get :review, on: :member
  end
  
  root to: 'decks#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

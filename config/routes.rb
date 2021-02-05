Rails.application.routes.draw do
  resources :decks do
    resources :cards
    get :review, on: :member  
  end
 
 
  resources :decks do
    resources :cards, only: :none do
      put :change_status, on: :member
      end
	end

  

  root to: 'decks#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

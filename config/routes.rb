Rails.application.routes.draw do
  root "decks#index"
  resources :decks do
    resource :random_card, only: [:show]
    resources :cards do
      resource :result, only: [:create, :show]
    end
  end
end

Rails.application.routes.draw do
  resources :decks do
    resources :cards
  end
end

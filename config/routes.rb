Rails.application.routes.draw do
  root "decks#index"
  get "/decks/:id/cards/random", to: "cards#random", as: "random_card"
  post "/decks/:deck_id/cards/:id", to: "cards#check", as: "check"
  get "/decks/:deck_id/cards/:id/right", to: "cards#right", as: "right"
  get "/decks/:deck_id/cards/:id/wrong", to: "cards#wrong", as: "wrong"
  resources :decks do
    resources :cards
  end
end

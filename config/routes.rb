Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new, :create, :destroy]
  end
  
  resources :songs, only: [:show, :destroy]
  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]
end

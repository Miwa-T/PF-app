Rails.application.routes.draw do

  devise_for :users, controllers: {
  sessions: 'users/sessions',
  password: 'users/passwords',
  registrations: 'users/registrations'
}

  root 'homes#top'

  scope module: :public do
    get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'user_unsubscribe'
    patch 'users/:id/withdraw' => 'users#withdraw', as: 'user_withdraw'
    resources :users, only: [:show, :edit, :update] do
      resources :relationships, only: [:create, :destroy]
      get :follows, on: :member
      get :followers, on: :member
    end
    get 'post_images/ranking' => 'post_images#ranking', as: 'post_image_ranking'
    resources :post_images do
      resources :comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
    end
    get 'searches/search'
  end

  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  password: 'admins/passwords',
  registrations: 'admins/registrations'
}

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    get 'searches/search'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

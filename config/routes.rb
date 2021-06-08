Rails.application.routes.draw do

  devise_for :users, controllers: {
  sessions: 'users/sessions',
  password: 'users/passwords',
  registrations: 'users/registrations'
}

  root 'homes#top'

  scope module: :public do
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'
    resources :users, only: [:show, :edit, :update]
    resources :post_images do
      resources :comments, only: [:create, :edit, :update, :destroy]
      resources :favorites, only: [:create, :destroy]
    end
  end

  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  password: 'admins/passwords',
  registrations: 'admins/registrations'
}

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

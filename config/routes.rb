Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :ordered_items, only: [:update]
    resources :orders, only: [:show, :update, :index]
  end

  scope module: :public do
    resource :customers, only: [:show]
    get 'customers/mypage/edit' => 'customers#edit', as: 'edit_customers'
    patch 'customers/update' => 'customers#update', as: 'update_customers'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:new, :create, :index, :edit, :update, :destroy
    ]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

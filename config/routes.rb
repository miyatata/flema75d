Rails.application.routes.draw do
  root "items#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                     }
  devise_scope :user do
    get "addresses", to: "users/registrations#new_address"
    post "addresses", to: "users/registrations#create_address"
  end

  # 購入確認ページに飛ぶ
  namespace :items do
    resources :buys, only: [:index]
  end

  # カテゴリ機能に使用
  namespace :api do
    resources :selects, only: [:index]
  end

  resources :items
end

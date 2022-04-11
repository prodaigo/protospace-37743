Rails.application.routes.draw do
  get 'users/show'
  devise_for :users  #devise_forで、ユーザー機能に必要な複数のルーティングを一度に生成
  root to: 'prototypes#index'  #ルートパスの指定
  resources :prototypes do  #prototypeの7つのアクションのルーティング自動生成
    resources :comments, only: :create  #commnetsのcreateアクションのルーティング自動生成、ネストにしprototypeのid情報を追加
  end
  resources :users, only: :show  #prototypeのshowアクションのルーティング自動生成
end

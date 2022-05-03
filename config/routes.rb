Rails.application.routes.draw do
  root 'books#index'
  # devise_for :users
  resources :books

  # ユーザ登録機能（registrations）、ログイン・ログアウト機能（sessions）へアクセスがあった場合
  # 下記のxxx.rbファイルを参照するように設定
  # ※ users、controllersモデルを参照する場合は、下記のファイルを参照する
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

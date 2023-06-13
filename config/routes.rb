Rails.application.routes.draw do
  # devise のモデルを作成したことでルーティングが自動的に追加
  # devise を使用する際に URL として users を含むことを示している
  devise_for :users
  # Topページに[root_path]を設定
  root to: "homes#top"

  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

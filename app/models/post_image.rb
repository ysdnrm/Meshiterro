class PostImage < ApplicationRecord
  has_one_attached :image

  # アソシエーション（Userに属するということ）
  belongs_to :user
    # PostImage モデルに関連付けられるのは、1 つの User モデル
    # このため、単数形の「user」になっている点に注意
end

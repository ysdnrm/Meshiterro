class PostImage < ApplicationRecord
  # ActiveStorage(画像の投稿、表示するためのもの)
  has_one_attached :image

  # アソシエーション(Postimage : User = N : 1 )（belongs_to = Userに属するということ）
  belongs_to :user
    # PostImage モデルに関連付けられるのは、1 つの User モデル
    # このため、単数形の「user」になっている点に注意
    
  # アソシエーション(PostImage : PostComment = 1 : N )(PostCommentsは複数形)
  has_many :post_comments, dependent: :destroy
  
  # アソシエーション(PostImage : Favorites = 1 : N )(Favoritesは複数形)
  has_many :favorites, dependent: :destroy
  
  # バリデーションの実装(フォームの未入力のチェックを行い、エラーメッセージを表示)
  validates :shop_name, presence: true
   validates :image, presence: true
    
    # 画像が投稿されなかった時に代わりの画僧を表示させる
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end  
    image
  end
  # 引数で渡されたユーザーが存在するか？
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end

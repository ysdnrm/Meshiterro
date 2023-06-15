class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #  ⇩アソシエーション(User : PostImage = 1 : N ),   ⇩ユーザーIDを消したら投稿も消える
  has_many :post_images, dependent: :destroy
  
  #   ⇩アソシエーション(Use : PostComment = 1 : N )
  has_many :post_comments, dependent: :destroy
  
 # プロフィール画像
  # profile_imageという名前でActiveStorageでプロフィール画像を保存できるように設定
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # 画像サイズの変換
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end

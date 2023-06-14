class PostImage < ApplicationRecord
  has_one_attached :image

  # アソシエーション（Userに属するということ）
  belongs_to :user
    # PostImage モデルに関連付けられるのは、1 つの User モデル
    # このため、単数形の「user」になっている点に注意
    
    # 画像が投稿されなかった時に代わりの画僧を表示させる
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end  
    image
  end
  
end

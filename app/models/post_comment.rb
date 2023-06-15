class PostComment < ApplicationRecord
 # アソシエーション( PostComment : User = N : 1 )(Userは単数系)
  belongs_to :user
 # アソシエーション(PostComment : PostImage = N : 1 )(PostImageは単数系)
  belongs_to :post_image
  
end

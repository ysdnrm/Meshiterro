class ApplicationController < ActionController::Base

  # deviseのコントローラは直接修正できないため、全てのコントローラに対する処理を行える権限を持つ、ApplicationControllerに
  # deviseのストロングパラメータを編集を記述する必要があります。
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # aboutページをサインイン後の遷移先に設定
   def after_sign_in_path_for(resource)
     post_images_path
   end
   
  # aboutページをサインアウト後の遷移先に設定
   def after_sign_out_path_for(resource)
     about_path
   end

# privateは記述をしたコントローラ内でしか参照できません。
# 一方、protectedは呼び出された他のコントローラからも参照することができます。
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # ストロングパラメータと同様の機能↑
  end
end

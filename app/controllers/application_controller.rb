class ApplicationController < ActionController::Base

  # deviseのコントローラは直接修正できないため、全てのコントローラに対する処理を行える権限を持つ、ApplicationControllerに
  # deviseのストロングパラメータを編集を記述する必要があります。
  before_action :configure_permitted_parameters, if: :devise_controller?

# privateは記述をしたコントローラ内でしか参照できません。
# 一方、protectedは呼び出された他のコントローラからも参照することができます。
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # ストロングパラメータと同様の機能↑
  end
end

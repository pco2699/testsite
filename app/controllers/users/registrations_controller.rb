class Users::RegistrationsController < Devise::RegistrationsController
  include Devise::Controllers::Rememberable
  def create
    data = User.create(user_params)
    remember_me(data)
    sign_in_and_redirect data, event: :authentication
  end

  def user_params
    params.require(:user).permit(
      :email, :provider, :uid, :name, :skype_id
    )
  end
end

class Users::PasswordsController < Devise::PasswordsController

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)

    home_path
  end
end

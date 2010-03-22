module AuthenticatedTestHelper
  # Sets the current app_user in the session from the app_user fixtures.
  def login_as(app_user)
    @request.session[:app_user_id] = app_user ? (app_user.is_a?(AppUser) ? app_user.id : app_users(app_user).id) : nil
  end

  def authorize_as(app_user)
    @request.env["HTTP_AUTHORIZATION"] = app_user ? ActionController::HttpAuthentication::Basic.encode_credentials(app_users(app_user).login, 'monkey') : nil
  end
  
end

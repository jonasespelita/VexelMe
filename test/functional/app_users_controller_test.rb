require File.dirname(__FILE__) + '/../test_helper'
require 'app_users_controller'

# Re-raise errors caught by the controller.
class AppUsersController; def rescue_action(e) raise e end; end

class AppUsersControllerTest < ActionController::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.
  include AuthenticatedTestHelper

  fixtures :app_users

  def test_should_allow_signup
    assert_difference 'AppUser.count' do
      create_app_user
      assert_response :redirect
    end
  end

  def test_should_require_login_on_signup
    assert_no_difference 'AppUser.count' do
      create_app_user(:login => nil)
      assert assigns(:app_user).errors.on(:login)
      assert_response :success
    end
  end

  def test_should_require_password_on_signup
    assert_no_difference 'AppUser.count' do
      create_app_user(:password => nil)
      assert assigns(:app_user).errors.on(:password)
      assert_response :success
    end
  end

  def test_should_require_password_confirmation_on_signup
    assert_no_difference 'AppUser.count' do
      create_app_user(:password_confirmation => nil)
      assert assigns(:app_user).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  def test_should_require_email_on_signup
    assert_no_difference 'AppUser.count' do
      create_app_user(:email => nil)
      assert assigns(:app_user).errors.on(:email)
      assert_response :success
    end
  end
  

  

  protected
    def create_app_user(options = {})
      post :create, :app_user => { :login => 'quire', :email => 'quire@example.com',
        :password => 'quire69', :password_confirmation => 'quire69' }.merge(options)
    end
end

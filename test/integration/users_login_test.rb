require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael) # users refer to the fixtures filename users.yml, the symbol :michael references the user with the michael key
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email, password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user                        # checks that the page has been redirected to @user
    follow_redirect!                                  # test follows redirect
    assert_template 'users/show'                      
    assert_select "a[href=?]", login_path, count: 0   # asserts that there are 0 links to login
    assert_select "a[href=?]", logout_path            # asserts there is a link to logout
    assert_select "a[href=?]", user_path(@user)       # asserts that there is a link to your profile page
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end

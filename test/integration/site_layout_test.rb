require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest # this was generated from running $ rails generate integration_test site_layout
  def setup
    @user = users(:michael)
  end

  test "layout links logged out" do
  	get root_path
  	assert_template 'static_pages/home' # checks that the static_pages/home template is being rendered
  	assert_select "a[href=?]", root_path, count: 2 # does the same as below but checks there are two such links (the logo and the navigation menu element)
  	assert_select "a[href=?]", help_path # checks for the presence of a particular link-URL combination 
  	# Rails injects help_path into the question mark and checks for an HTML tag of the form <a href="/about">...</a>
  	assert_select "a[href=?]", about_path
  	assert_select "a[href=?]", contact_path
  	get contact_path
  	assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
  end

  test "layout links logged in" do
    log_in_as(@user)
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path
  end
end

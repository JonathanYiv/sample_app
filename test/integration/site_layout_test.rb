require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest # this was generated from running $ rails generate integration_test site_layout
  # test "the truth" do
  #   assert true
  # end
  test "layout links" do
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
end

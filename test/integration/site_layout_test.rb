require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:billy)
  end

  test "layout_links if NOT logged in" do 
    get root_url
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", "https://ko-fi.com/kewpiedoll"
    # footer
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", contact_path
    
    get contact_path
    assert_select "title", full_title("Contact")
  end

  test "layout_links if logged in" do 
    log_in_as(@user)
    get root_url
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", signup_path, count: 1
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", logout_path
    # footer
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", contact_path
    
    assert_select "a[href=?]", "https://ko-fi.com/kewpiedoll"
    get contact_path
    assert_select "title", full_title("Contact")
  end
end

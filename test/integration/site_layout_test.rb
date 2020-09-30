require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "layout_links" do 
    get root_url
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path, count: 2
    assert_select "a[href=?]", "https://ko-fi.com/kewpiedoll", count: 2
    get contact_path
    assert_select "title", full_title("Contact")
  end
end

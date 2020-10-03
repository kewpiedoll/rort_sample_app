require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "reject invalid user signup and errors" do 
    get signup_path
    assert_no_difference 'User.count' do 
      post users_path, params: { user: { name: "",
                                 email: "user@invalid",
                                 password: "foo",
                                 password_confirmation: "bar"} }
    end
    # ensure new page re-renders after rejection
    assert_template 'users/new'

    # and contains error messages
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "accept a valid user" do 
    get signup_path
    assert_difference 'User.count' do 
      post users_path, params: { user: { name: "test name",
                                 email: "user@valid.com",
                                 password: "foobar",
                                 password_confirmation: "foobar"} }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end
end

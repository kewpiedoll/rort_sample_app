require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "American Runner"
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", @base_title
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

  test "should get chris" do
    get chris_url
    assert_response :success
    assert_select "title", "About Chris | #{@base_title}"
  end

    test "should get jer" do
    get jer_url
    assert_response :success
    assert_select "title", "About Jer | #{@base_title}"
  end
end

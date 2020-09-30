require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "page title helper" do 
    assert_equal full_title, "American Runner"
    assert_equal full_title("Help"), "Help | American Runner"
  end
end

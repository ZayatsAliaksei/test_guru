require "test_helper"

class Admin::GistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_gist_index_url
    assert_response :success
  end
end

require "test_helper"

class AnswerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get answer_index_url
    assert_response :success
  end

  test "should get show" do
    get answer_show_url
    assert_response :success
  end

  test "should get create" do
    get answer_create_url
    assert_response :success
  end

  test "should get update" do
    get answer_update_url
    assert_response :success
  end

  test "should get destroy" do
    get answer_destroy_url
    assert_response :success
  end
end

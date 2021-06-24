require 'test_helper'

class Public::MypostImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_mypost_images_index_url
    assert_response :success
  end
end

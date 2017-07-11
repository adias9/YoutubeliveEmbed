require 'test_helper'

class EmbedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get embed_index_url
    assert_response :success
  end

end

require 'test_helper'

class ShapeInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shape_infos_index_url
    assert_response :success
  end

end

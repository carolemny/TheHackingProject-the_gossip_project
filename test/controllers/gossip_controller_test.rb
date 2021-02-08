require 'test_helper'

class GossipControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get gossip_list_url
    assert_response :success
  end

end

require "test_helper"

class CollabsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collab = collabs(:one)
  end

  test "should get index" do
    get collabs_url, as: :json
    assert_response :success
  end

  test "should create collab" do
    assert_difference('Collab.count') do
      post collabs_url, params: { collab: { campaign_id: @collab.campaign_id, content_creator_id: @collab.content_creator_id, note: @collab.note } }, as: :json
    end

    assert_response 201
  end

  test "should show collab" do
    get collab_url(@collab), as: :json
    assert_response :success
  end

  test "should update collab" do
    patch collab_url(@collab), params: { collab: { campaign_id: @collab.campaign_id, content_creator_id: @collab.content_creator_id, note: @collab.note } }, as: :json
    assert_response 200
  end

  test "should destroy collab" do
    assert_difference('Collab.count', -1) do
      delete collab_url(@collab), as: :json
    end

    assert_response 204
  end
end

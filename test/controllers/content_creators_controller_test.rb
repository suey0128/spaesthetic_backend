require "test_helper"

class ContentCreatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_creator = content_creators(:one)
  end

  test "should get index" do
    get content_creators_url, as: :json
    assert_response :success
  end

  test "should create content_creator" do
    assert_difference('ContentCreator.count') do
      post content_creators_url, params: { content_creator: { ave_rate_per_campaign: @content_creator.ave_rate_per_campaign, email: @content_creator.email, first_name: @content_creator.first_name, gender: @content_creator.gender, instagram_connection_permission: @content_creator.instagram_connection_permission, instagram_feamle_follower_ratio: @content_creator.instagram_feamle_follower_ratio, instagram_follower: @content_creator.instagram_follower, instagram_top1_follow_location: @content_creator.instagram_top1_follow_location, instagram_url: @content_creator.instagram_url, instagram_username: @content_creator.instagram_username, last_name: @content_creator.last_name, password_digest: @content_creator.password_digest, paypal_account: @content_creator.paypal_account, username: @content_creator.username } }, as: :json
    end

    assert_response 201
  end

  test "should show content_creator" do
    get content_creator_url(@content_creator), as: :json
    assert_response :success
  end

  test "should update content_creator" do
    patch content_creator_url(@content_creator), params: { content_creator: { ave_rate_per_campaign: @content_creator.ave_rate_per_campaign, email: @content_creator.email, first_name: @content_creator.first_name, gender: @content_creator.gender, instagram_connection_permission: @content_creator.instagram_connection_permission, instagram_feamle_follower_ratio: @content_creator.instagram_feamle_follower_ratio, instagram_follower: @content_creator.instagram_follower, instagram_top1_follow_location: @content_creator.instagram_top1_follow_location, instagram_url: @content_creator.instagram_url, instagram_username: @content_creator.instagram_username, last_name: @content_creator.last_name, password_digest: @content_creator.password_digest, paypal_account: @content_creator.paypal_account, username: @content_creator.username } }, as: :json
    assert_response 200
  end

  test "should destroy content_creator" do
    assert_difference('ContentCreator.count', -1) do
      delete content_creator_url(@content_creator), as: :json
    end

    assert_response 204
  end
end

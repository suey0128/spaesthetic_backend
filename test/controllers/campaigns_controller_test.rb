require "test_helper"

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign = campaigns(:one)
  end

  test "should get index" do
    get campaigns_url, as: :json
    assert_response :success
  end

  test "should create campaign" do
    assert_difference('Campaign.count') do
      post campaigns_url, params: { campaign: { address: @campaign.address, application_deadline: @campaign.application_deadline, business_id: @campaign.business_id, city: @campaign.city, compensation_market_value: @campaign.compensation_market_value, compensation_type: @campaign.compensation_type, content_sent_by: @campaign.content_sent_by, country: @campaign.country, description: @campaign.description, end_date: @campaign.end_date, image: @campaign.image, location_name: @campaign.location_name, location_type: @campaign.location_type, must_post_by: @campaign.must_post_by, name: @campaign.name, require_following_female_ratio: @campaign.require_following_female_ratio, require_following_location: @campaign.require_following_location, require_following_minimum: @campaign.require_following_minimum, require_gender: @campaign.require_gender, require_others: @campaign.require_others, start_date: @campaign.start_date, state: @campaign.state, zip: @campaign.zip } }, as: :json
    end

    assert_response 201
  end

  test "should show campaign" do
    get campaign_url(@campaign), as: :json
    assert_response :success
  end

  test "should update campaign" do
    patch campaign_url(@campaign), params: { campaign: { address: @campaign.address, application_deadline: @campaign.application_deadline, business_id: @campaign.business_id, city: @campaign.city, compensation_market_value: @campaign.compensation_market_value, compensation_type: @campaign.compensation_type, content_sent_by: @campaign.content_sent_by, country: @campaign.country, description: @campaign.description, end_date: @campaign.end_date, image: @campaign.image, location_name: @campaign.location_name, location_type: @campaign.location_type, must_post_by: @campaign.must_post_by, name: @campaign.name, require_following_female_ratio: @campaign.require_following_female_ratio, require_following_location: @campaign.require_following_location, require_following_minimum: @campaign.require_following_minimum, require_gender: @campaign.require_gender, require_others: @campaign.require_others, start_date: @campaign.start_date, state: @campaign.state, zip: @campaign.zip } }, as: :json
    assert_response 200
  end

  test "should destroy campaign" do
    assert_difference('Campaign.count', -1) do
      delete campaign_url(@campaign), as: :json
    end

    assert_response 204
  end
end

require "test_helper"

class ReferralServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referral_service = referral_services(:one)
  end

  test "should get index" do
    get referral_services_url, as: :json
    assert_response :success
  end

  test "should create referral_service" do
    assert_difference('ReferralService.count') do
      post referral_services_url, params: { referral_service: { campaign_id: @referral_service.campaign_id, content_creator_id: @referral_service.content_creator_id, employee_name: @referral_service.employee_name } }, as: :json
    end

    assert_response 201
  end

  test "should show referral_service" do
    get referral_service_url(@referral_service), as: :json
    assert_response :success
  end

  test "should update referral_service" do
    patch referral_service_url(@referral_service), params: { referral_service: { campaign_id: @referral_service.campaign_id, content_creator_id: @referral_service.content_creator_id, employee_name: @referral_service.employee_name } }, as: :json
    assert_response 200
  end

  test "should destroy referral_service" do
    assert_difference('ReferralService.count', -1) do
      delete referral_service_url(@referral_service), as: :json
    end

    assert_response 204
  end
end

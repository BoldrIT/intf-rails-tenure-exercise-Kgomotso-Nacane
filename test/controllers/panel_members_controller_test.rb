require "test_helper"

class PanelMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @panel_member = panel_members(:panel1_member1)
  end

  test "should get index" do
    get panel_members_url, as: :json
    assert_response :success
  end

  test "should create panel_member" do
    assert_difference('PanelMember.count') do
      post panel_members_url, params: { panel_member: { panel_id: @panel_member.panel_id, user_id: @panel_member.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show panel_member" do
    get panel_member_url(@panel_member), as: :json
    assert_response :success
  end

  test "should update panel_member" do
    patch panel_member_url(@panel_member), params: { panel_member: { panel_id: @panel_member.panel_id, user_id: @panel_member.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy panel_member" do
    assert_difference('PanelMember.count', -1) do
      delete panel_member_url(@panel_member), as: :json
    end

    assert_response 204
  end
end

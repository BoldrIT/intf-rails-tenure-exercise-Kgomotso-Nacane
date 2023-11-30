require "test_helper"

class WorkStepPanelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_step_panel = work_step_panels(:workstep1_panel1)
  end

  test "should get index" do
    get work_step_panels_url, as: :json
    assert_response :success
  end

  test "should create work_step_panel" do
    assert_difference('WorkStepPanel.count') do
      post work_step_panels_url, params: { work_step_panel: { panel_id: @work_step_panel.panel_id, work_step_id: @work_step_panel.work_step_id } }, as: :json
    end

    assert_response 201
  end

  test "should show work_step_panel" do
    get work_step_panel_url(@work_step_panel), as: :json
    assert_response :success
  end

  test "should update work_step_panel" do
    patch work_step_panel_url(@work_step_panel), params: { work_step_panel: { panel_id: @work_step_panel.panel_id, work_step_id: @work_step_panel.work_step_id } }, as: :json
    assert_response 200
  end

  test "should destroy work_step_panel" do
    assert_difference('WorkStepPanel.count', -1) do
      delete work_step_panel_url(@work_step_panel), as: :json
    end

    assert_response 204
  end
end

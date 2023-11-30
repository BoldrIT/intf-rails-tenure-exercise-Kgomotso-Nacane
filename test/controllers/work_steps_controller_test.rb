require "test_helper"

class WorkStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_step = work_steps(:workstep1)
  end

  test "should get index" do
    get work_steps_url, as: :json
    assert_response :success
  end

  test "should create work_step" do
    assert_difference('WorkStep.count') do
      post work_steps_url, params: { work_step: { case_id: @work_step.case_id, current: @work_step.current, step_number: @work_step.step_number } }, as: :json
    end

    assert_response 201
  end

  test "should show work_step" do
    get work_step_url(@work_step), as: :json
    assert_response :success
  end

  test "should update work_step" do
    patch work_step_url(@work_step), params: { work_step: { case_id: @work_step.case_id, current: @work_step.current, step_number: @work_step.step_number } }, as: :json
    assert_response 200
  end

  test "should destroy work_step" do
    assert_difference('WorkStep.count', -1) do
      delete work_step_url(@work_step), as: :json
    end

    assert_response 204
  end
end

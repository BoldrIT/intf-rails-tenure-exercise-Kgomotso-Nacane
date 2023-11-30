require "test_helper"

class CasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @case = cases(:case1)
  end

  test "should get index" do
    get cases_url, as: :json
    assert_response :success
  end

  test "should create case" do
    assert_difference('Case.count') do
      post cases_url, params: { case: { candidate_email: @case.candidate_email, candidate_fullname: @case.candidate_fullname, due_date: @case.due_date, institution_id: @case.institution_id } }, as: :json
    end

    assert_response 201
  end

  test "should show case" do
    get case_url(@case), as: :json
    assert_response :success
  end

  test "should update case" do
    patch case_url(@case), params: { case: { candidate_email: @case.candidate_email, candidate_fullname: @case.candidate_fullname, due_date: @case.due_date, institution_id: @case.institution_id } }, as: :json
    assert_response 200
  end

  test "should destroy case" do
    assert_difference('Case.count', -1) do
      delete case_url(@case), as: :json
    end

    assert_response 204
  end
end

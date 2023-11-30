require "test_helper"

class CasesController::IndexTest < ActionController::TestCase
  def test_index
    get :index

    assert_response :success
    assert_equal "application/json; charset=utf-8", response.content_type
    json = JSON.parse(response.body)
    case_json = json["results"].first

    the_case = cases(:case1)
    assert_equal the_case.id, case_json["id"]
    assert_equal the_case.candidate_fullname, case_json["candidate_fullname"]
    assert_equal the_case.candidate_email, case_json["candidate_email"]
    assert_equal the_case.due_date, case_json["due_date"]
    assert_equal the_case.applicant_has_been_notified?, case_json["applicant_has_been_notified"]
    assert_equal the_case.current_step_number, case_json["current_step_number"]
    assert_equal the_case.current_step_due_date, case_json["current_step_due_date"]
    assert_equal the_case.current_step_all_requirements_complete?, case_json["current_step_all_requirements_complete"]
    assert_equal the_case.current_panel_name, case_json["current_panel_name"]
  end
end

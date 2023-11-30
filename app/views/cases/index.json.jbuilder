json.set! :results do
  json.array! @cases do |a_case|
    json.id a_case.id
    json.candidate_fullname a_case.candidate_fullname
    json.candidate_email a_case.candidate_email
    json.due_date a_case.due_date
    json.applicant_has_been_notified a_case.applicant_has_been_notified?
    json.current_step_number a_case.current_step_number
    json.current_step_due_date a_case.current_step_due_date
    json.current_step_all_requirements_complete a_case.current_step_all_requirements_complete?
    json.current_panel_name a_case.current_panel_name
  end
end

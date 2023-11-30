institution1 = Institution.create(name: "University of Coolness")

user1 = User.create!(
  email: "awesomeemail1@domain.com",
  unique_identifier: "myawesomeID1",
  institution: institution1
)
user2 = User.create!(
  email: "awesomeemail2@domain.com",
  unique_identifier: "myawesomeID2",
  institution: institution1
)


case1 = institution1
  .cases
  .create(
    candidate_fullname: "Pancho Villa",
    candidate_email: "panchovilla@revolution.mx",
    due_date: Time.now + 5.months
  )

case2 = institution1
  .cases
  .create(
    candidate_fullname: "Rosita Alvirez",
    candidate_email: "rosita@revolution.mx",
    due_date: Time.now + 8.months
  )

panel1 = Panel.create(case: case1, name: "Primary Panel")
case1.current_work_step.panels << panel1

panel_member1 = panel1.panel_members.create(user: user1)
panel_member2 = panel1.panel_members.create(user: user2)

25.times do |index|
  current_case = institution1
    .cases
    .create(
      candidate_fullname: "Pancho Villa #{index + 1}",
      candidate_email: "panchovilla@revolution#{index + 1}.mx",
      due_date: Time.now + 5.months
    )
  panel = current_case.panels.first
  5.times do |other_index|
    panel.action_items.create(description: "My random todo item: #{other_index}")
  end

  10.times do |other_index|
    current_case.work_steps.create(step_number: current_case.current_work_step.step_number + 1, current: true, due_date: Time.now + 10.days)
  end
end


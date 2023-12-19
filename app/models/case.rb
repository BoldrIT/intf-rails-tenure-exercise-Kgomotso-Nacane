class Case < ApplicationRecord
  belongs_to :institution

  has_many :work_steps, dependent: :destroy
  has_many :panel_recusals, dependent: :destroy
  has_many :panels, dependent: :destroy

  after_create :create_first_work_step

  # Here I replaced `select` and `first` methods with `find` to enhance the code clarity
  def current_work_step
    @current_work_step ||= these_work_steps.find(&:current)
  end

  def current_step_number
    current_work_step.step_number
  end

  def current_step_due_date
    current_work_step.due_date
  end

  def current_panel_name
    current_work_step.panel_name
  end

  def current_step_all_requirements_complete?
    current_work_step.all_requirements_complete?
  end

  def previous_work_step
    return nil if current_work_step.step_number == 1 rescue nil
    @previous_work_step ||= these_work_steps.select { |step| step.step_number == current_work_step.step_number - 1 }.first rescue nil
  end

  def next_work_step
    @next_work_step ||= these_work_steps.select { |step| step.step_number == current_work_step.step_number + 1 }.first rescue nil
    if @current_work_step.blank? && applicant_has_been_notified?
      @next_work_step ||= these_work_steps.select { |step| step.step_number == 1 }.first rescue nil
    end
    @next_work_step
  end

  def these_work_steps
    work_steps
  end

  def applicant_has_been_notified?
    !applicant_was_notified_at.blank?
  end

  def as_json(options = {})
    super(options).merge(
      previous_step_number: calculate_previous_step_number,
      next_step_number: calculate_next_step_number,
      user: {
        id: user.id,
        email: user.email,
        unique_identifier: user.unique_identifier,
        institution: user.institution
      }
    )
  end

  private

  # For better readability and maintainability,
  # I broke down the `crete_first_work_step` method into smaller methods to handle specific tasks.
  # I would say this makes it more modular.
  def create_first_work_step
    build_first_work_step
  end

  def build_first_work_step
    these_work_steps.build(step_number: 0, current: true).tap do |work_step|
      build_first_panel(work_step)
      work_step.save
    end
  end

  def build_first_panel(work_step)
    panel = Panel.new(case_id: id, name: "Case is Being Created")
    work_step.panels << panel
  end

  def calculate_previous_step_number
    previous_work_step&.step_number
  end

  def calculate_next_step_number
    next_work_step&.step_number
  end
end

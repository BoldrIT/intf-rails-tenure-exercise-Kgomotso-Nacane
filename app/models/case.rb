class Case < ApplicationRecord
  belongs_to :institution

  has_many :work_steps, dependent: :destroy
  has_many :panel_recusals, dependent: :destroy
  has_many :panels, dependent: :destroy

  after_create :create_first_work_step

  def current_work_step
    @current_work_step ||= these_work_steps.select { |step| step.current }.first rescue nil
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

  private

  def create_first_work_step
    these_work_steps.build(step_number: 0, current: true).tap do |work_step|
      panel = Panel.new(case_id: self.id, name: "Case is Being Created")
      work_step.panels << panel
      work_step.save
    end
  end
end

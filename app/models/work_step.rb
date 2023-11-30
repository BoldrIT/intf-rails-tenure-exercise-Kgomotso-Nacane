class WorkStep < ApplicationRecord
  belongs_to :case

  has_many :work_step_panels, dependent: :destroy
  has_many :panels, through: :work_step_panels

  def panel_name
    current_panel&.name
  end

  def current_panel
    panels.first
  end

  def all_requirements_complete?
    panels.each do |panel|
      requirement = panel.requirement(self)
      next if requirement.blank?
      return false if !requirement.has_been_completed?
    end

    true
  end
end

class Panel < ApplicationRecord
  belongs_to :case

  has_many :panel_members, dependent: :destroy

  has_many :work_step_panels, dependent: :destroy

  has_many :action_items, dependent: :destroy

  def requirement(step)
    work_step_panels.find_by_work_step_id(step.id)
  end
end

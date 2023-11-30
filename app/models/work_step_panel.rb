class WorkStepPanel < ApplicationRecord
  belongs_to :work_step
  belongs_to :panel

  def has_been_completed?
    panel.action_items.select do |action|
      action.completed == false
    end.none?
  end
end

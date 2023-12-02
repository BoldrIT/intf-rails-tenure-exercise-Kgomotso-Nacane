class AddPreviousAndNextStepNumberToCases < ActiveRecord::Migration[6.1]
  def change
    add_column :cases, :previous_step_number, :integer
    add_column :cases, :next_step_number, :integer
  end
end

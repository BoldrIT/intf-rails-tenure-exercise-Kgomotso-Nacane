class CreateWorkStepPanels < ActiveRecord::Migration[6.1]
  def change
    create_table :work_step_panels do |t|
      t.references :work_step, null: false, foreign_key: true
      t.references :panel, null: false, foreign_key: true

      t.timestamps
    end
  end
end

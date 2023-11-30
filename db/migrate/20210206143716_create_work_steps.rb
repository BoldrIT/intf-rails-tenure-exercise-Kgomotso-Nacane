class CreateWorkSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :work_steps do |t|
      t.integer :step_number, null: false
      t.boolean :current, default: false
      t.references :case, null: false, foreign_key: true
      t.datetime :due_date

      t.timestamps
    end
  end
end

class CreateCases < ActiveRecord::Migration[6.1]
  def change
    create_table :cases do |t|
      t.string :candidate_fullname, null: false
      t.string :candidate_email, null: false
      t.datetime :due_date
      t.references :institution, null: false, foreign_key: true

      t.timestamps
    end
  end
end

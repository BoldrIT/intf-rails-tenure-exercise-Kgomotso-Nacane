class CreatePanels < ActiveRecord::Migration[6.1]
  def change
    create_table :panels do |t|
      t.string :name, null: false
      t.integer :case_id

      t.timestamps
    end

    add_foreign_key :panels, :cases
  end
end

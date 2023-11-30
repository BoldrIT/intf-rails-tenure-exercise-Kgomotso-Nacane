class CreateActionItems < ActiveRecord::Migration[6.1]
  def change
    create_table :action_items do |t|
      t.references :panel, null: false, foreign_key: true
      t.text :description
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end

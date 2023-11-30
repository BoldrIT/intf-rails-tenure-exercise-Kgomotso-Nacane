class CreatePanelMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :panel_members do |t|
      t.references :panel, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

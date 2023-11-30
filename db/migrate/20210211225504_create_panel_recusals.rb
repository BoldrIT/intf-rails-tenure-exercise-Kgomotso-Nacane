class CreatePanelRecusals < ActiveRecord::Migration[6.1]
  def change
    create_table :panel_recusals do |t|
      t.references :panel_member, null: false, foreign_key: true
      t.references :case, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

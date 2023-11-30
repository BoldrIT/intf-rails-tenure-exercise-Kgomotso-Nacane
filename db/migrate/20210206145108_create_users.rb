class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :unique_identifier, null: false, unique: true
      t.references :institution, null: false, foreign_key: true

      t.timestamps
    end
  end
end

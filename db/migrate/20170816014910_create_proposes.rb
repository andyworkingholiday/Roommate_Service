class CreateProposes < ActiveRecord::Migration
  def change
    create_table :proposes do |t|
      t.integer :user_id
      t.integer :other_id
      t.boolean :okay
      t.timestamps null: false
    end
  end
end

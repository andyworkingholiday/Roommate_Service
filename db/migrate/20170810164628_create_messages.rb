class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
       t.text :body
       t.references :conversation, index: true
       t.references :user, index: true
       t.boolean :read, :default => false
       t.integer :conversation_id
       t.integer :user_id

      t.timestamps null: false
    end
  end
end

class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :gender
      t.string :category
      t.string :school_name
      t.integer :age
      t.boolean :one_time
      t.boolean :expose
      
      # 질문 관련 
      t.string :aa
      t.string :ab
      t.string :ac
      t.string :ad
      
      t.timestamps null: false
    end
  end
end

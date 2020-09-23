class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :text_save
      t.string :img_src
      
      t.timestamps
    end
  end
end

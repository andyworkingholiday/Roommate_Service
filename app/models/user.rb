class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :proposes
    
    
    
    mount_uploader :image, ImageUploader
    after_save :store_image!
    before_save :write_image_identifier
    after_commit :remove_image!, on: :destroy
    after_commit :mark_remove_image_false, on: :update
    after_save :store_previous_changes_for_image
    after_commit :remove_previously_stored_image, on: :update
    
    has_many :conversations, :foreign_key => :sender_id
    
  def  self . search ( search ) 
  where("gender LIKE ?", "%#{search}%" )  
  end 
   
end

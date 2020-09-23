class UserInfo < ActiveRecord::Base
    
 def  self . search ( search ) 
   where("aa LIKE ?", "%#{search}%" )  
   where("school_name LIKE ?", "%#{search}%" ) 
   where("gender LIKE ?", "%#{search}%" ) 
 end 
   
#  filterrific
#   :default_filter_params: { sorted_by: 'created_at_DESC' },
#   :available_filters => %w[
#                 sorted_by
#                 search_query
#                 user_id
#                 school_name
#               ]
# # define ActiveRecord scopes for
# # :search_query, :sorted_by, :with_country_id, and :with_created_at_gte
end
 
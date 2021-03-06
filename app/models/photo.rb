class Photo < ActiveRecord::Base
  
  
  has_attached_file :user_photo,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :storage => :Dropboxstorage,
                    :path => "/:attachment/:attachment/:id/:style/:filename"
  
end

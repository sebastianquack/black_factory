class Image < ActiveRecord::Base
  attr_accessible :image, :challenge_id, :design_id, :ip
  has_attached_file :image, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "100x100>" }
end

class Challenge < ActiveRecord::Base
  attr_accessible :description, :name, :time, :hidden, :main_image_id
  has_many :designs
  has_many :comments
  has_many :images
  has_many :media_links
  belongs_to :main_image, {:class_name => 'Image'} 

  default_scope order('time')
end

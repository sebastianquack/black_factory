class Challenge < ActiveRecord::Base
  attr_accessible :description, :name, :time, :hidden, :main_image_id, :winner_design_id
  has_many :designs
  has_many :comments
  has_many :images
  has_many :media_links
  belongs_to :main_image, {:class_name => 'Image'} 
	belongs_to :winner_design, {:class_name => 'Design'} 

  default_scope order('time')
end

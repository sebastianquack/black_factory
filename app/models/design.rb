class Design < ActiveRecord::Base
  attr_accessible :challenge_id, :description, :name, :username, :hidden, :main_image_id
  belongs_to :challenge
  has_many :votes, {:class_name => 'VoteCookie'}
  has_many :comments
  has_many :images
  belongs_to :main_image, {:class_name => 'Image'} 

end

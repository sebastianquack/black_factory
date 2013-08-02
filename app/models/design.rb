class Design < ActiveRecord::Base
  attr_accessible :challenge_id, :description, :name, :username, :hidden, :main_image_id, :media_link_id, :score, :vote_count
  belongs_to :challenge
  has_many :votes, {:class_name => 'VoteCookie'}
  has_many :comments
  has_many :images
  has_one :media_link
  belongs_to :main_image, {:class_name => 'Image'} 

  after_create :init_votes
  
  def init_votes
  	self.score = 0
  	self.vote_count = 0
  	self.save
  end

end

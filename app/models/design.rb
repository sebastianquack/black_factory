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
  	self.score = Design.average('score')
  	self.vote_count = 0
  	self.save
  	vote_cookie = VoteCookie.new
  	vote_cookie.design_id = self.id
  	vote_cookie.vote = self.score
  	vote_cookie.save
  end

end

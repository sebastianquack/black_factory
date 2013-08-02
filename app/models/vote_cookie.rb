class VoteCookie < ActiveRecord::Base
  attr_accessible :cookiehash, :design_id, :ip, :vote
  belongs_to :design
  
  before_save :calculate_score
  before_destroy :calculate_score
  
  def calculate_score
  	score = VoteCookie.where(design_id: self.design_id).sum('vote')
  	d = Design.find(self.design_id)
  	d.score = score
  	d.save
  end
  
  
  
end

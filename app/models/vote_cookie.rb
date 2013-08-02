class VoteCookie < ActiveRecord::Base
  attr_accessible :cookiehash, :design_id, :ip, :vote
  belongs_to :design
  
  before_save :calculate_score, :count_votes
  before_destroy :calculate_score, :count_votes
  
  def calculate_score
  	score = VoteCookie.where(design_id: self.design_id).sum('vote')
  	if Design.exists?(self.design_id)
		d = Design.find(self.design_id)
		d.score = score
		d.save
	end
  end
  
  def count_votes
  	vote_count = VoteCookie.where(design_id: self.design_id).length
  	if Design.exists?(self.design_id)
  		d = Design.find(self.design_id)
  		d.vote_count = vote_count
  		d.save
  	end
  end
  
end

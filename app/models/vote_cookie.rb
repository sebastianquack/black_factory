class VoteCookie < ActiveRecord::Base
  attr_accessible :cookiehash, :design_id, :ip, :vote
  belongs_to :design
  
  after_save :count_votes, :calculate_score
  after_destroy :count_votes, :calculate_score
  
  def calculate_score
  	score = VoteCookie.where(:design_id => self.design_id).sum('vote')
  	#score1 = VoteCookie.where("design_id = ? AND vote = 1", self.design_id).count
  	#score2 = VoteCookie.where("design_id = ? AND vote = 2", self.design_id).count
  	#score3 = VoteCookie.where("design_id = ? AND vote = 3", self.design_id).count
  	#score4 = VoteCookie.where("design_id = ? AND vote = 4", self.design_id).count
  	#score5 = VoteCookie.where("design_id = ? AND vote = 5", self.design_id).count
  	#vote_count = VoteCookie.where(design_id: self.design_id).count
  	#score = (1*score1 + 2*score2 + 3*score3 + 4*score4 + 5*score5) / vote_count.to_f
  	if Design.exists?(self.design_id)
		d = Design.find(self.design_id)
		d.score = score
		d.save
	end
  end
  
  def count_votes
  	vote_count = VoteCookie.where(design_id: self.design_id).count
  	if Design.exists?(self.design_id)
  		d = Design.find(self.design_id)
  		d.vote_count = vote_count
  		d.save
  	end
  end
  
end

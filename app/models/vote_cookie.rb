class VoteCookie < ActiveRecord::Base
  attr_accessible :cookiehash, :design_id, :ip, :vote
  belongs_to :design
end

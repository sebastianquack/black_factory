class VoteCookie < ActiveRecord::Base
  attr_accessible :design_id, :hash, :ip, :vote
end

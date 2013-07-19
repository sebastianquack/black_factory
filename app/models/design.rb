class Design < ActiveRecord::Base
  attr_accessible :challenge_id, :description, :name
  belongs_to :challenge
  has_many :votes, {:class_name => 'VoteCookie'}
end

class Design < ActiveRecord::Base
  attr_accessible :challenge_id, :description, :name, :username
  belongs_to :challenge
  has_many :votes, {:class_name => 'VoteCookie'}
  has_many :comments
end

class Design < ActiveRecord::Base
  attr_accessible :challenge_id, :description, :name, :username, :hidden
  belongs_to :challenge
  has_many :votes, {:class_name => 'VoteCookie'}
  has_many :comments
end

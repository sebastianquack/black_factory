class Comment < ActiveRecord::Base
  attr_accessible :content, :challenge_id, :design_id, :ip, :username
  default_scope order('created_at DESC')
  belongs_to :challenge
  belongs_to :design
end

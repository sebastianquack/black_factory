class MediaLink < ActiveRecord::Base
  attr_accessible :challenge_id, :design_id, :ip, :url, :hidden
  belongs_to :design
  belongs_to :challenge
end

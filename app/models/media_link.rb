class MediaLink < ActiveRecord::Base
  attr_accessible :challenge_id, :design_id, :ip, :url
end

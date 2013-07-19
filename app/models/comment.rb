class Comment < ActiveRecord::Base
  attr_accessible :content, :design_id, :ip, :username
end

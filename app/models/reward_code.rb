class RewardCode < ActiveRecord::Base
  attr_accessible :achievement_id, :code, :points, :type, :status
end

class Challenge < ActiveRecord::Base
  attr_accessible :description, :name, :time
  has_many :designs
  has_many :comments
  default_scope order('time')
end

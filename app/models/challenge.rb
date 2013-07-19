class Challenge < ActiveRecord::Base
  attr_accessible :description, :name, :time
  has_many :designs
end

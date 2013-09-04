class HomeController < ApplicationController

def welcome
	@challenges = Challenge.where(:hidden => false)
	@first_challenge = Challenge.order('time ASC').first

end

def tutorial
end

end

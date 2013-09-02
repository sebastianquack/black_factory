class HomeController < ApplicationController

def welcome
	@challenges = Challenge.where(:hidden => false)
end

def tutorial
end

end

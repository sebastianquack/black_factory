class HomeController < ApplicationController

def welcome
	@challenges = Challenge.all
end

end

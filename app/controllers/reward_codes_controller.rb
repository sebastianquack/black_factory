class RewardCodesController < ApplicationController
  
  before_filter :authenticate, except: [:highscores, :claim]

	def highscores
		@scores = UsernameScore.order("score DESC")
		@cookie_username = cookies[:username]

	end
  
  def claim  
  		
  	score = UsernameScore.where(:username => params[:username].strip.capitalize).first
  	unless score
  		score = UsernameScore.new
  		score.score = 0
  		score.username = params[:username].strip.capitalize
  	end
  	
		logger.debug score.username

		code = RewardCode.where(:code => params[:code].strip.upcase).first
 		if code
 			if code.status == 0
 			 	score.score = score.score + code.points
	 			score.save
	 			code.status = 1
	 			code.save
	 			cookies.permanent[:username] = score.username
 				@message_class = 'alert-success'
 				@message = '<strong>Gratulation!</strong> ' + score.username + ' wurden ' + code.points.to_s + ' Punkte gutgeschrieben.'
 			else
 				@message_class = 'alert-warning'
 				@message = '<strong>Hinweis</strong> Code schon benutzt!'
 			end
 		else
 		 	@message_class = 'alert-warning'
 			@message = '<strong>Hinweis</strong> Code nicht erkannt!'
 		end
  	
  	@cookie_username = cookies[:username]
		@scores = UsernameScore.all
		render action: "highscores"
  end
  
  # GET /reward_codes
  # GET /reward_codes.json
	def index
    @reward_codes = RewardCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reward_codes }
    end
  end

  # GET /reward_codes/1
  # GET /reward_codes/1.json
  def show
    @reward_code = RewardCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reward_code }
    end
  end

  # GET /reward_codes/new
  # GET /reward_codes/new.json
  def new
    @reward_code = RewardCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reward_code }
    end
  end

	def generate_form	
	end

	def generate
		if params[:amount].to_i < 100
			(1..params[:amount].to_i).each do |i|
				reward_code = RewardCode.new
				
				new_code = ""
				j = 0
				begin
					new_code = (0...6).map{(65+rand(26)).chr}.join
					j = j + 1
				end while RewardCode.where(:code => new_code).first && j < 10 			
	
				reward_code.code = new_code			
				reward_code.points = params[:points]
				reward_code.save
			end
		end
		redirect_to action: "index"
	end

  # GET /reward_codes/1/edit
  def edit
    @reward_code = RewardCode.find(params[:id])
  end

  # POST /reward_codes
  # POST /reward_codes.json
  def create
    @reward_code = RewardCode.new(params[:reward_code])

    respond_to do |format|
      if @reward_code.save
        format.html { redirect_to @reward_code, notice: 'Reward code was successfully created.' }
        format.json { render json: @reward_code, status: :created, location: @reward_code }
      else
        format.html { render action: "new" }
        format.json { render json: @reward_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reward_codes/1
  # PUT /reward_codes/1.json
  def update
    @reward_code = RewardCode.find(params[:id])

    respond_to do |format|
      if @reward_code.update_attributes(params[:reward_code])
        format.html { redirect_to @reward_code, notice: 'Reward code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reward_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_codes/1
  # DELETE /reward_codes/1.json
  def destroy
    @reward_code = RewardCode.find(params[:id])
    @reward_code.destroy

    respond_to do |format|
      format.html { redirect_to reward_codes_url }
      format.json { head :no_content }
    end
  end
end

require 'securerandom'

class ChallengesController < ApplicationController
 
  # GET /challenges/1
  # GET /challenges/1.json
  def show_public
    @challenge = Challenge.find(params[:id])

		@comment = Comment.new
		@cookie_username = cookies[:username]
		@cookie_username = 'Anonym' if @cookie_username.nil?
		
		@designs_sorted = []
		@challenge.designs.each do |design|
			unless design.hidden
				@designs_sorted.push({ :design => design,
					:votes => VoteCookie.where(design_id: design.id).sum('vote')
				})
			end
		end
		@designs_sorted.sort_by! {|d| - d[:votes]}
		
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @challenge }
    end
  end

  # GET /challenges/1/designs
  # GET /challenges/1/designs.json
  def designs_public
    @designs = Challenge.find(params[:id]).designs

    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @designs }
    end
  end

  # GET /challenges/designs
  # GET /challenges/designs.json?challenge_id=1
  def designs_public_urlparam
  
    @designs = Challenge.find(params[:challenge_id]).designs

    respond_to do |format|
      # format.html # show.html.erb
      format.json { render json: @designs }
    end
  end

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @challenges }
    end
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @challenge }
    end
  end

  # GET /challenges/new
  # GET /challenges/new.json
  def new
    @challenge = Challenge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @challenge }
    end
  end

  # GET /challenges/1/edit
  def edit
    @challenge = Challenge.find(params[:id])
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(params[:challenge])

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render json: @challenge, status: :created, location: @challenge }
      else
        format.html { render action: "new" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /challenges/1
  # PUT /challenges/1.json
  def update
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      if @challenge.update_attributes(params[:challenge])
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy

    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end
end

require 'securerandom'

class DesignsController < ApplicationController

	# GET /designs/1
	# GET /designs/1.json
	def show_public
		@design = Design.find(params[:id])
		cookie_hash = cookies[:vote_hash]
		cookie_hash = cookies.permanent[:vote_hash] = SecureRandom.uuid if cookie_hash.nil?
		@vote_cookie = VoteCookie.where(cookiehash: cookie_hash, design_id: @design.id).first
		if @vote_cookie.nil?
			@vote_cookie = VoteCookie.new 
			@vote_cookie.vote = 0
		end

		#prepare forms
		@comment = Comment.new
		@cookie_username = cookies[:username]
		@cookie_username = 'Anonym' if @cookie_username.nil?

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @design }
		end
	end

	def creator
		@challenge = Challenge.find(params[:challenge_id])
		@cookie_username = cookies[:username]
		@cookie_username = 'Anonym' if @cookie_username.nil?
		@design = Design.new
		@design_upload_hash = SecureRandom.uuid
	end

	def create_public 

    @design = Design.new(params[:design].except(:upload_hash))
		
    respond_to do |format|
      if @design.save
			
				images = Image.where(:upload_hash => params[:design][:upload_hash])
      	images.each do |image|
					image.design_id = @design.id
					image.upload_hash = ''
					image.save
				end
				
				if params[:images]
					params[:images].each do |id, values|				
						image = Image.find(id)
						image.description = values[:description]
						image.save
					end
				end
				
		ml = MediaLink.new
		ml.design_id = @design.id
		ml.url = params[:media_link]
		ml.save
		
				
      	cookies.permanent[:username] = @design.username
      	
    	u = UsernameScore.where(:username => @design.username).first_or_create :score => 0
		u.save      	
      	
        format.html { 
        	redirect_to :controller => "designs", :action => "show_public", :id => @design.id
        }
        format.json { render json: @design, status: :created, location: @design }
      else
        format.html { 
        	redirect_to :controller => "challenges", :action => "show_public", :id => params[:design][:challenge_id]
        }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end
  end

	def vote 		
		cookie_hash = cookies[:vote_hash]
		cookie_hash = cookies.permanent[:vote_hash] = SecureRandom.uuid if cookie_hash.nil?
		
		@design = Design.find(params[:id])
		
		if params[:value].to_i > 0 && params[:value].to_i < 6
			record = VoteCookie.where(cookiehash: cookie_hash, design_id: @design.id).first
			if record == nil
				record = VoteCookie.new
				record.design_id = @design.id
				record.cookiehash = cookie_hash
			end
			record.vote = params[:value]
			record.save
		end
		
		@design = Design.find(params[:id]) # updated with scores!
	
		#redirect_to :action => "show_public", :id => @design
		render json: {status: 'ok', score: @design.score, id: @design.id, vote_count: @design.vote_count}
	
	end

  # GET /designs
  # GET /designs.json
  def index
    @designs = Design.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @designs }
    end
  end

  # GET /designs/1
  # GET /designs/1.json
  def show
    @design = Design.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @design }
    end
  end

  # GET /designs/new
  # GET /designs/new.json
  def new
    @design = Design.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @design }
    end
  end

  # GET /designs/1/edit
  def edit
    @design = Design.find(params[:id])
  end

  # POST /designs
  # POST /designs.json
  def create
    @design = Design.new(params[:design])

    respond_to do |format|
      if @design.save
        format.html { redirect_to @design, notice: 'Design was successfully created.' }
        format.json { render json: @design, status: :created, location: @design }
      else
        format.html { render action: "new" }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /designs/1
  # PUT /designs/1.json
  def update
    @design = Design.find(params[:id])

    respond_to do |format|
      if @design.update_attributes(params[:design])
        format.html { redirect_to @design, notice: 'Design was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designs/1
  # DELETE /designs/1.json
  def destroy
    @design = Design.find(params[:id])
    @design.destroy

    respond_to do |format|
      format.html { redirect_to designs_url }
      format.json { head :no_content }
    end
  end
end

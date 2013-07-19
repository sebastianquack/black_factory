class VoteCookiesController < ApplicationController
  # GET /vote_cookies
  # GET /vote_cookies.json
  def index
    @vote_cookies = VoteCookie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vote_cookies }
    end
  end

  # GET /vote_cookies/1
  # GET /vote_cookies/1.json
  def show
    @vote_cooky = VoteCookie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote_cooky }
    end
  end

  # GET /vote_cookies/new
  # GET /vote_cookies/new.json
  def new
    @vote_cooky = VoteCookie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vote_cooky }
    end
  end

  # GET /vote_cookies/1/edit
  def edit
    @vote_cooky = VoteCookie.find(params[:id])
  end

  # POST /vote_cookies
  # POST /vote_cookies.json
  def create
    @vote_cooky = VoteCookie.new(params[:vote_cooky])

    respond_to do |format|
      if @vote_cooky.save
        format.html { redirect_to @vote_cooky, notice: 'Vote cookie was successfully created.' }
        format.json { render json: @vote_cooky, status: :created, location: @vote_cooky }
      else
        format.html { render action: "new" }
        format.json { render json: @vote_cooky.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vote_cookies/1
  # PUT /vote_cookies/1.json
  def update
    @vote_cooky = VoteCookie.find(params[:id])

    respond_to do |format|
      if @vote_cooky.update_attributes(params[:vote_cooky])
        format.html { redirect_to @vote_cooky, notice: 'Vote cookie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote_cooky.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_cookies/1
  # DELETE /vote_cookies/1.json
  def destroy
    @vote_cooky = VoteCookie.find(params[:id])
    @vote_cooky.destroy

    respond_to do |format|
      format.html { redirect_to vote_cookies_url }
      format.json { head :no_content }
    end
  end
end

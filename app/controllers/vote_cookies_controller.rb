class VoteCookiesController < ApplicationController
  # GET /vote_cookies
  # GET /vote_cookies.json
	before_filter :authenticate

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
    @vote_cookie = VoteCookie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote_cookie }
    end
  end

  # GET /vote_cookies/new
  # GET /vote_cookies/new.json
  def new
    @vote_cookie = VoteCookie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vote_cookie }
    end
  end

  # GET /vote_cookies/1/edit
  def edit
    @vote_cookie = VoteCookie.find(params[:id])
  end

  # POST /vote_cookies
  # POST /vote_cookies.json
  def create
    @vote_cookie = VoteCookie.new(params[:vote_cookie])

    respond_to do |format|
      if @vote_cookie.save
        format.html { redirect_to @vote_cookie, notice: 'Vote cookie was successfully created.' }
        format.json { render json: @vote_cookie, status: :created, location: @vote_cookie }
      else
        format.html { render action: "new" }
        format.json { render json: @vote_cookie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vote_cookies/1
  # PUT /vote_cookies/1.json
  def update
    @vote_cookie = VoteCookie.find(params[:id])

    respond_to do |format|
      if @vote_cookie.update_attributes(params[:vote_cookie])
        format.html { redirect_to @vote_cookie, notice: 'Vote cookie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote_cookie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_cookies/1
  # DELETE /vote_cookies/1.json
  def destroy
    @vote_cookie = VoteCookie.find(params[:id])
    @vote_cookie.destroy

    respond_to do |format|
      format.html { redirect_to vote_cookies_url }
      format.json { head :no_content }
    end
  end
end

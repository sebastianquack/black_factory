class UsernameCookiesController < ApplicationController
  # GET /username_cookies
  # GET /username_cookies.json

  before_filter :authenticate

  def index
    @username_cookies = UsernameCookie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @username_cookies }
    end
  end

  # GET /username_cookies/1
  # GET /username_cookies/1.json
  def show
    @username_cookie = UsernameCookie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @username_cookie }
    end
  end

  # GET /username_cookies/new
  # GET /username_cookies/new.json
  def new
    @username_cookie = UsernameCookie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @username_cookie }
    end
  end

  # GET /username_cookies/1/edit
  def edit
    @username_cookie = UsernameCookie.find(params[:id])
  end

  # POST /username_cookies
  # POST /username_cookies.json
  def create
    @username_cookie = UsernameCookie.new(params[:username_cookie])

    respond_to do |format|
      if @username_cookie.save
        format.html { redirect_to @username_cookie, notice: 'Username cookie was successfully created.' }
        format.json { render json: @username_cookie, status: :created, location: @username_cookie }
      else
        format.html { render action: "new" }
        format.json { render json: @username_cookie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /username_cookies/1
  # PUT /username_cookies/1.json
  def update
    @username_cookie = UsernameCookie.find(params[:id])

    respond_to do |format|
      if @username_cookie.update_attributes(params[:username_cookie])
        format.html { redirect_to @username_cookie, notice: 'Username cookie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @username_cookie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /username_cookies/1
  # DELETE /username_cookies/1.json
  def destroy
    @username_cookie = UsernameCookie.find(params[:id])
    @username_cookie.destroy

    respond_to do |format|
      format.html { redirect_to username_cookies_url }
      format.json { head :no_content }
    end
  end
end

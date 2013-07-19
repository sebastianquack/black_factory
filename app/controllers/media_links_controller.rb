class MediaLinksController < ApplicationController
  # GET /media_links
  # GET /media_links.json
  def index
    @media_links = MediaLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @media_links }
    end
  end

  # GET /media_links/1
  # GET /media_links/1.json
  def show
    @media_link = MediaLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @media_link }
    end
  end

  # GET /media_links/new
  # GET /media_links/new.json
  def new
    @media_link = MediaLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @media_link }
    end
  end

  # GET /media_links/1/edit
  def edit
    @media_link = MediaLink.find(params[:id])
  end

  # POST /media_links
  # POST /media_links.json
  def create
    @media_link = MediaLink.new(params[:media_link])

    respond_to do |format|
      if @media_link.save
        format.html { redirect_to @media_link, notice: 'Media link was successfully created.' }
        format.json { render json: @media_link, status: :created, location: @media_link }
      else
        format.html { render action: "new" }
        format.json { render json: @media_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /media_links/1
  # PUT /media_links/1.json
  def update
    @media_link = MediaLink.find(params[:id])

    respond_to do |format|
      if @media_link.update_attributes(params[:media_link])
        format.html { redirect_to @media_link, notice: 'Media link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @media_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_links/1
  # DELETE /media_links/1.json
  def destroy
    @media_link = MediaLink.find(params[:id])
    @media_link.destroy

    respond_to do |format|
      format.html { redirect_to media_links_url }
      format.json { head :no_content }
    end
  end
end

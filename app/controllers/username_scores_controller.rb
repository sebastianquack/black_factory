class UsernameScoresController < ApplicationController
  # GET /username_scores
  # GET /username_scores.json
  def index
    @username_scores = UsernameScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @username_scores }
    end
  end

  # GET /username_scores/1
  # GET /username_scores/1.json
  def show
    @username_score = UsernameScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @username_score }
    end
  end

  # GET /username_scores/new
  # GET /username_scores/new.json
  def new
    @username_score = UsernameScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @username_score }
    end
  end

  # GET /username_scores/1/edit
  def edit
    @username_score = UsernameScore.find(params[:id])
  end

  # POST /username_scores
  # POST /username_scores.json
  def create
    @username_score = UsernameScore.new(params[:username_score])

    respond_to do |format|
      if @username_score.save
        format.html { redirect_to @username_score, notice: 'Username score was successfully created.' }
        format.json { render json: @username_score, status: :created, location: @username_score }
      else
        format.html { render action: "new" }
        format.json { render json: @username_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /username_scores/1
  # PUT /username_scores/1.json
  def update
    @username_score = UsernameScore.find(params[:id])

    respond_to do |format|
      if @username_score.update_attributes(params[:username_score])
        format.html { redirect_to @username_score, notice: 'Username score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @username_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /username_scores/1
  # DELETE /username_scores/1.json
  def destroy
    @username_score = UsernameScore.find(params[:id])
    @username_score.destroy

    respond_to do |format|
      format.html { redirect_to username_scores_url }
      format.json { head :no_content }
    end
  end
end

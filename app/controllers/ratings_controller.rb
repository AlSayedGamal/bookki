class RatingsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @ratings = (params[:user_id].present?) ? Rate.where(rater_id: params[:user_id]) : Rate.all(order: "created_at desc")
    @user = User.find(params[:user_id]) if params[:user_id].present?

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @books }
    end
  end

  def edit
    @rate = Rate.find(params[:id])
  end

  def update
    @rate = Rate.find(params[:id])

    respond_to do |format|
      if @rate.update_attributes(params[:rate])
        format.html { redirect_to ratings_path, notice: 'Rating was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
end

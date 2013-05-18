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
end

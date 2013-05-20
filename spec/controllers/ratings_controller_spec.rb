require 'spec_helper'

describe RatingsController do
  render_views
  include Devise::TestHelpers
  before(:each) do
      @user = FactoryGirl.create :user
      @user1 = FactoryGirl.create :user
      sign_in @user
      @book1 = FactoryGirl.create :book
      @book2 = FactoryGirl.create :book
      @r1 = @book1.rate 3, @user.id, "rating"
      @r2 = @book1.rate 2, @user1.id, "rating"
    end
  describe "Ratings home" do
    it "should list all system ratings" do
      Rate.should_receive(:all).and_return([@r1, @r2])
      @r1.should_receive(:rater).twice.and_return(@user)
      @r2.should_receive(:rater).twice.and_return(@user1)
      @r2.should_receive(:book).twice.and_return(@book1)
      @r1.should_receive(:book).twice.and_return(@book1)
      @r1.should_receive(:stars).and_return(3.to_f)
      @r2.should_receive(:stars).and_return(2.to_f)
      @r1.should_receive(:created_at).and_return(DateTime.now)
      @r2.should_receive(:created_at).and_return(DateTime.now)
      get :index
    end
    
    it "should list all user ratings" do
      Rate.should_receive(:where).with(rater_id: @user.id.to_s).and_return( [@r1] )
      @r1.should_receive(:rater).twice.and_return(@user)      
      @r1.should_receive(:book).twice.and_return(@book1)
      @r1.should_receive(:stars).and_return(3.to_f)
      @r1.should_receive(:created_at).and_return(DateTime.now)
      get :index, {user_id: @user.id}
    end
    it "should render correctly" do
      get :index
      response.should be_success
    end
    it "should select the ratings index template" do
      get :index
      response.should render_template("index")
    end
  end
end

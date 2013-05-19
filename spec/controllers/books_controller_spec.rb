require 'spec_helper'

describe BooksController do
  render_views
  include Devise::TestHelpers
  describe "books index" do
    before(:each) do
      @user = FactoryGirl.create :user
      sign_in @user
      @book1 = FactoryGirl.create :book
      @book2 = FactoryGirl.create :book
    end
    it "successful request" do
      get :index
      response.should be_success
    end
    it "should select the books index template" do
      get :index
      response.should render_template("index")
    end
    it "should contain the two books names and ISBN" do
      get :index
      response.body.should have_content(@book1.title)
      response.body.should have_content(@book2.title)
    end
  end

  describe "book show" do
    before(:each) do
      @user = FactoryGirl.create :user
      sign_in @user
      @book1 = FactoryGirl.create :book
    end

    it "should be successful request" do
      get :show, {id: @book1.id}
      response.should be_success
    end

    it "should contain book isbn" do
      get :show, {id: @book1.id}
      response.body.should have_content(@book1.title)
      response.body.should have_content(@book1.isbn)
    end
  end
  describe "Admin book edit" do
    before(:each) do
      @user = FactoryGirl.create :user, :admin
      sign_in @user
      @book1 = FactoryGirl.create :book
    end

    it "should be successful request" do
      get :edit, {id: @book1.id}
      response.should be_success
    end

    it "should contain book isbn" do
      get :show, {id: @book1.id}
      response.body.should have_content(@book1.title)
      response.body.should have_content(@book1.isbn)
    end

    it "should submit to update" do
      post :update, {id: @book1.id, isbn: "1122334455667", title: "Some new title"}
      response.should redirect_to book_path(@book1)
    end

  end
  describe "user book create" do
    before(:each) do
      @user = FactoryGirl.create :user
      sign_in @user
    end

    it "should be successful request" do
      get :new
      response.should be_success
    end

    it "should contain creation form" do
      get :new
      response.body.should have_content("Title")
      response.body.should have_content("Isbn")
    end

    it "should submit to create" do
      post :create, {book: {isbn: "1122334455667", title: "Some new title"}}
      response.should redirect_to book_path(Book.last)
    end
  end
end
require 'spec_helper'

describe Book do
  it "should validate presence of title and ISBN" do
    b = Book.new title: "", isbn: ""
    expect{b.save!}.to raise_error ActiveRecord::RecordInvalid
    Book.all.count.should == 0
  end

  it "should validate format of ISBN" do
    wrong_one = Book.new title: "sometitle", isbn: "012"
    expect{wrong_one.save!}.to raise_error ActiveRecord::RecordInvalid
    Book.all.count.should == 0
    correct_one = Book.new title: "sometitle", isbn: "0123432112345"
    correct_one.save!
    Book.all.count.should == 1
  end

  it "should validate uniqueness of ISBN" do
    some_book = Book.create title: "sometitle", isbn: "0123432112345"
    expect{Book.create! title: "sometitle", isbn: "0123432112345"}.to raise_error ActiveRecord::RecordInvalid
    Book.all.count.should == 1
  end

  it "should keep the average of ratings" do
    book = Factory.create :book
    user1 = Factory.create :user
    user2 = Factory.create :user
    user3 = Factory.create :user
    book.rate 3, user1.id, "rating"
    book.rate 1, user2.id, "rating"
    book.rate 2, user3.id, "rating"
    book.rating_average.avg.should == 2.0
  end

end

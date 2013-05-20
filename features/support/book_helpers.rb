def create_book(book_hash = {})
  FactoryGirl.create :book, book_hash
end
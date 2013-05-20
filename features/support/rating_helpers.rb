def create_rating(rating_hash = {})
  user = @session_users[rating_hash[:user]]
  unless @session_books == {}
    book = @session_books[rating_hash[:book]]
  else
    book = @book
  end
  book.rate rating_hash[:stars].to_i, user.id, "rating"
end

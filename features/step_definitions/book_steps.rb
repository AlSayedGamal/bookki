And /^I should be able rate (.*) stars link$/ do |stars|
  sleep 5
  find(".span9 .star img[alt='#{stars}']").click
end

Given /^(?:I (have|am)|there (?:is|are)) the following books?$/ do |who, books_table|
  @session_books ||= {}
  books_table.map_headers! do |cell|
    cell.downcase.gsub(/\s/, '_').to_sym
  end
  if books_table.hashes.count > 1
    books_table.hashes.each do |book_hash|
      book = create_book(book_hash)
      @session_books[book.isbn] = book
    end
  else
    @book = create_book(books_table.hashes.first)
  end
end

When /^I follow book number (.*?) in the list$/ do |position|
  find(:xpath, "/html/body/div[2]/div/div[2]/table/tbody/tr[#{position}]/td[#{position}]/a").click
end
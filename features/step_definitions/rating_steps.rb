Given /^(?:I (have|am)|there (?:is|are)) the following ratings?$/ do |who, ratings_table|
  @session_ratings ||= {}
  ratings_table.map_headers! do |cell|
    cell.downcase.gsub(/\s/, '_').to_sym
  end
  if ratings_table.hashes.count > 1
    ratings_table.hashes.each do |rating_hash|
      rating = create_rating(rating_hash)
      @session_ratings[rating_hash[:user]] = rating
    end
  else
    @rating = create_rating(ratings_table.hashes.first)
  end
end

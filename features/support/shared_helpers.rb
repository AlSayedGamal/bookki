require 'uri'

def path_for(page_name)
  case page_name
  when /^home$/i
    '/'
  # User-related
  when /^registrations?$/i, /^sign up$/i
    '/users/sign_up'
  when /^login$/i, /^sign in/i
    '/users/sign_in'
  when /^logout/i, /^sign out/i
    '/users/sign_out'
  # Need-related
  when /^new book$/i
    'books/new'
  when /^book with id (.*?)$/i
    "books/#{$1}"
  else
    raise "Undefined path for #{page_name} page"
  end
end

def path_from_url(url)
  URI(url).path
end

def selector_for_within(within_elm)
  case within_elm
  when 'book side bar'
    '.side-bar'
  when 'main content area'
    '.span9'
  else
    raise "Undefined selector for #{within_elm}"
  end
end

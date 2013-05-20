require 'uri'

def path_for(page_name)
  case page_name
  when /^home$/i
    '/'
  # User-related
  when /^registrations?$/i, /^sign up$/i
    '/sign_up'
  when /^login$/i, /^sign in/i
    '/sign_in'
  when /^logout/i, /^sign out/i
    '/sign_out'
  # Need-related
  when /^new need$/i
    '/needs/new'
  when /^"(.*?)" need$/i
    "/needs/#{find_need_by_title($1).slug}"
  else
    raise "Undefined path for #{page_name} page"
  end
end

def upload_path
  'test/fixtures/uploads'
end

def fixture_file(filename)
  Rails.root.join("#{upload_path}/#{filename}")
end

def uploaded_file_from_path(path)
  Rails.root.join("public/#{path}")
end

def path_from_url(url)
  URI(url).path
end

def selector_for_within(within_elm)
  case within_elm
  when 'need report'
    '.need-report'
  when 'need image report'
    '.need-image-report'
  else
    raise "Undefined selector for #{within_elm}"
  end
end

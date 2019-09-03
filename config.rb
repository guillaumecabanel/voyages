require 'slim'

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :blog do |blog|
  blog.permalink = "{trip_slug}/{year}{month}{day}.html"
  blog.sources = "{trip_slug}/{year}{month}{day}.html"
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

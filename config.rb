require 'slim'

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :blog do |blog|
  blog.permalink = "{trip_slug}/{year}{month}{day}.html"
  blog.sources = "{trip_slug}/{year}{month}{day}.html"
end

helpers do
  def video_tags_for(content)
    result = content.gsub(/\{video-autoplay\}\((.+)\)/,
      <<~HTML
<div class="video mb-2">
  <video class="mx-auto" autoplay muted loop>
    <source src="https://res.cloudinary.com/dsapqckal/video/upload/c_scale,q_80,w_824/#{'\1'}.webm"
    type="video/webm">
    <source src="https://res.cloudinary.com/dsapqckal/video/upload/c_scale,q_80,w_824/#{'\1'}.mp4"
    type="video/mp4">
    <source src="https://res.cloudinary.com/dsapqckal/video/upload/c_scale,q_80,w_824/#{'\1'}.ogv"
    type="video/ogg">
    <a href="https://res.cloudinary.com/dsapqckal/video/upload/c_scale,q_80,w_824/#{'\1'}.mp4">Vidéo</a>
  </video>
</div>
      HTML
    )

    result.gsub(/\{video\}\((.+)\)/,
      <<~HTML
<div class="video mb-2">
  <video class="mx-auto" controls>
    <source src="https://res.cloudinary.com/dsapqckal/video/upload/c_scale,q_80,w_824/#{'\1'}.webm"
    type="video/webm">
    <source src="https://res.cloudinary.com/dsapqckal/video/upload/c_scale,q_80,w_824/#{'\1'}.mp4"
    type="video/mp4">
    <source src="https://res.cloudinary.com/dsapqckal/video/upload/c_scale,q_80,w_824/#{'\1'}.ogv"
    type="video/ogg">
    <a href="https://res.cloudinary.com/dsapqckal/video/upload/c_scale,q_80,w_824/#{'\1'}.mp4">Vidéo</a>
  </video>
</div>
      HTML
    )
  end

  def add_non_breakable_spaces_for(content)
    content.gsub(/ ([\!:])/, '&nbsp;\1')
  end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end


# autoplay muted loop

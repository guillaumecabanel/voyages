string = "rere\n{video}(croatie/GOPR0759_1567779594209_high_sxwelf)\nrere"

result = string.gsub /\{video-?(autoplay)?\}\((.+)\)/ do
  $2
end

puts result

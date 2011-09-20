#!/usr/bin/env ruby

ARGV.each do |path|
  puts path
  m = path.match /(.*)\.png$/
  left, ext = m[1], 'png'
  `mkdir -p _hover`
  `mkdir -p _active`
  d1 = "_hover/#{left}.#{ext}"
  d2 = "_active/#{left}.#{ext}"
  `/usr/bin/env convert '#{path}' -brightness-contrast -18 '#{d1}'`
  `/usr/bin/env convert '#{path}' -brightness-contrast -40 '#{d2}'`
  `optipng++ #{path} #{d1} #{d2}`
end

#!/usr/bin/env ruby

ARGV.each do |path|
  `optipng -o7 #{path}`
  # TODO png-guts strip text
end

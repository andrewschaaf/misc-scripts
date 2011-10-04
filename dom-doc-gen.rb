#!/usr/bin/env ruby

def run(cmd)
  out = `bash -c '#{cmd}'`
  code = $?.to_i
  if code != 0
    throw "code: #{code}"
  end
  out
end

src, dest = ARGV
out = run "catR '#{src}' | egrep -o 'ID_[0-9A-Za-z_]+' | sort | uniq"
lines = out.split /\n/
groups = lines.group_by {|id| id.split(/_/)[1]}
groups.each do |k, ids|
  puts ""
  ids.each do |id|
    puts id
  end
end

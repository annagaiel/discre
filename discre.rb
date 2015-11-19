#!/usr/bin/env ruby
require 'csv'

csv1 = ARGV[0]
csv2 = ARGV[1]
concern = ARGV[2]

data1 = CSV.readlines(ARGV[0], :headers => true)
data2 = CSV.readlines(ARGV[1], :headers => true)

results = []

(0...data1.size).each do |index|
  temp_data_1 = data1[index].to_s.split(',')
  temp_data_2 = data2[index].to_s.split(',')

  if temp_data_1[1].gsub(/^(https?\:\/\/(www.)?)?youtube.com\/channel\//, '').gsub(/^UC/, '') != temp_data_2[1].gsub(/^(https?\:\/\/(www.)?)?youtube.com\/channel\//, '').gsub(/^UC/, '')
     results << temp_data_1[0] if concern == "channel_ownership" || concern.to_s.empty?
  elsif temp_data_1[2].gsub(/\,/,'') != temp_data_2[2].gsub(/\,/,'')
     results << temp_data_1[0] if concern == "subscriber_count" || concern.to_s.empty?
  end

end

results.each do |email|
  puts email
end
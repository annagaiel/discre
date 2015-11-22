#!/usr/bin/env ruby
require 'csv'
require 'pry'

csv1 = ARGV[0]
csv2 = ARGV[1]
concern = ARGV[2]

data1 = CSV.readlines(csv1, :headers => true)
data2 = CSV.readlines(csv2, :headers => true)

results = []

# Returns true if youtube_channel_1 is not equal to youtube_channel_2
# Removes the youtube site and UC
def youtube_difference(youtube_channel_1, youtube_channel_2)
  youtube_channel_1.gsub(/^(https?\:\/\/(www.)?)?youtube.com\/channel\//, '').gsub(/^UC/, '') != youtube_channel_2.gsub(/^(https?\:\/\/(www.)?)?youtube.com\/channel\//, '').gsub(/^UC/, '')
end

# Returns true if subscriber_count_1 is not equal to subscriber_count_2
# Removes the non numerical characters such as quotes and commas
def subcriber_difference(subscriber_count_1, subscriber_count_2)
  subscriber_count_1.gsub(/[^0-9]/, '') != subscriber_count_2.gsub(/[^0-9]/, '')
end

# Returns true if email is not in results and concern is emtpy or is equal to channel_ownership or  subscriber_count
def check_concern(concern, results, arg, email)
  concern == arg || concern.to_s.empty? && !results.include?(email)
end

(0...data1.size).each do |index|
  row_1 = data1[index]
  row_2 = data2[index]

  if youtube_difference(row_1[" YouTube Channel"], row_2[" YouTube Channel"]) && check_concern(concern, results, "channel_ownership", row_1["Account Email"])
      results << row_1["Account Email"]
  end

  if subcriber_difference(row_1[" Subscriber Count"], row_2[" Subscriber Count"]) && check_concern(concern, results, "subscriber_count", row_2["Account Email"])
      results << row_1["Account Email"]
  end

end

results.each do |email|
  puts email
end

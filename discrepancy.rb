require 'csv'

CSV.foreach('CSV1.csv') do |row|
  puts row.inspect
end

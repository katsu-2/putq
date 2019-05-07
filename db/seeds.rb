require "csv"

CSV.foreach('db/category.csv') do |row|
  Category.create!(name: row[1])
end

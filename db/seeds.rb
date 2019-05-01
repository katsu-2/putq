require "csv"

CSV.foreach('db/category.csv') do |row|
  Category.create!(name: row[1],
                  parent_id: row[2],
                  )
end

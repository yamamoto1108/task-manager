require "csv"

CSV.foreach('db/backgrounds.csv', headers: true) do |row|
  Background.find_or_create_by(id: row[0], image: row[1], created_at: row[2], updated_at: row[3])
end

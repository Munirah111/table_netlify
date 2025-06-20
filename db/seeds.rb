require_relative '../config/environment'
require 'csv'

csv_path = Rails.root.join('db', 'seeds', 'Table_Input.csv')
puts "📥 Seeding from: #{csv_path}"

TableEntry.destroy_all

CSV.foreach(csv_path, headers: true).with_index do |row, index|
  TableEntry.create!(
    row_number: index + 1,                # A1, A2, A3, ...
    value: row['Value']&.strip.to_f      # Get only the 'Value' column
  )
end

puts "✅ Seeded #{TableEntry.count} entries."



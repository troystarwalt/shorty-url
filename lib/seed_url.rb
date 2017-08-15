require 'csv'
module Seeder
  class SeedUrl
    def self.seed
      csv_content = open_file
      csv = CSV.parse(csv_content, headers: true)
      csv.each do |row|
        Shorty.create(original: row["url"], use_count: rand(0..100))
      end
    end

    def self.open_file
      File.read('public/csv-data/ae.csv')
    end
  end
end

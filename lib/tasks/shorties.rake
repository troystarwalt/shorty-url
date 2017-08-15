require 'seed_url'

namespace :shorties do
  desc "Seed production database."
  task seed_urls: :environment do
    Seeder::SeedUrl.seed
  end  
end

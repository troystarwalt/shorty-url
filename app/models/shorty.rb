class Shorty < ApplicationRecord
  validates :original, :shortened, presence: true

  def self.create_unique_key
    shortened_url = SecureRandom.base58(5)
  end
end

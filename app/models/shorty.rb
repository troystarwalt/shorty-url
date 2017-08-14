class Shorty < ApplicationRecord
  validates :original, :shortened, presence: true

  before_validation :smart_add_url_protocol

  validate :valid_uri

  def self.create_unique_key
    shortened_url = SecureRandom.base58(5)
  end

  protected

  def smart_add_url_protocol
    return if self.original.blank?
    unless self.original[/\Ahttp:\/\//] || self.original[/\Ahttps:\/\//]
      self.original = "http://#{self.original}"
    end
  end

  def valid_uri
    if (self.original =~ URI::ABS_URI) == nil
      errors.add(:original, 'Not a valid URL')
    end
  end
end

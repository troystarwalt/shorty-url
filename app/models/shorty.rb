class Shorty < ApplicationRecord
  validates :original, :shortened, presence: true

  before_validation :smart_add_url_protocol, :create_unique_key
  validate :valid_uri

  protected

  def create_unique_key
    self.shortened = SecureRandom.base58(5)
  end

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

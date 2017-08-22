class Shorty < ApplicationRecord
  validates :original, presence: true

  before_validation :smart_add_url_protocol
  # after_create :create_unique_key
  # after_save
  validate :valid_uri

  def unique_key
    hashid = Hashids.new('I love short urls')
    @unique_key = hashid.encode(self.id)
  end

  protected

  # def create_unique_key
  #   hashid = Hashids.new(self.original)
  #   self.shortened = hashid.encode(self.id)
  # end

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

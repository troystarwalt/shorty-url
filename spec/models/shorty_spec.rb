require 'rails_helper'

RSpec.describe Shorty, type: :model do
  let(:valid_shorty) { FactoryGirl.create(:shorty) }
  let(:invalid_shorty) { FactoryGirl.create(:invalid_shorty) }

  it 'has a valid factory' do
    expect(valid_shorty).to be_valid
  end

  describe 'invalid #shorty' do
    it 'is invalid when original is not a valid url' do
      expect(FactoryGirl.build(:shorty, original: 'www. fejk.com')).not_to be_valid
    end

    it 'is invalid when there is not an original url present' do
      expect(FactoryGirl.build(:invalid_shorty, original: '')).not_to be_valid
    end

    it 'is invalid when there is not an original url is nil' do
      expect(FactoryGirl.build(:invalid_shorty, original: nil)).not_to be_valid
    end
  end

  describe 'valid #shorty' do
    it 'is valid when original is present and valid' do
      expect(FactoryGirl.build(:shorty)).to be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Category, :type => :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:posts) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end
end

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:categories) }
    it { should belong_to(:author) }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
  end
end

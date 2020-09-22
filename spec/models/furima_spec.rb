require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @tweet = FactoryBot.build(:furima)
  end

  
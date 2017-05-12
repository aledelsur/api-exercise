require 'rails_helper'

RSpec.describe Tag, type: :model do
  context "Associations" do
    it { should belong_to(:url) }
  end
end
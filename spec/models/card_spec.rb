require 'rails_helper'
describe Board do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:background) { create(:background) }

  describe '#create' do
    it 'is valid with a name, about, deadline, finish, list' do
      card = build(:card)
      expect(card).to be_valid
    end

    it 'is invalid without a name' do
      card = build(:card, name: "")
      card.valid?
      expect(card.errors[:name]).to include("を入力してください")
    end

    it 'is invalid with a name that has more than 20 characters' do
      card = build(:card, name: "aaaaaaaaaaaaaaaaaaaaa")
      card.valid?
      expect(card.errors[:name][0]).to include("は20文字以内で入力してください")
    end

    it 'is valid with a name that has 20 characters' do
      card = build(:card, name: "aaaaaaaaaaaaaaaaaaaa")
      expect(card).to be_valid
    end

    it 'is valid without an about' do
      card = build(:card, about: "")
      expect(card).to be_valid
    end

    it 'is valid without a deadline' do
      card = build(:card, deadline: "")
      expect(card).to be_valid
    end

  end
end

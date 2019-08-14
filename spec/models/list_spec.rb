require 'rails_helper'
describe List do
  let(:board) { create(:board) }

  describe '#create' do
    it 'is valid with a name, board' do
      list = build(:list)
      expect(list).to be_valid
    end

    it 'is invalid without a name' do
      list = build(:list, name: "")
      list.valid?
      expect(list.errors[:name]).to include("を入力してください")
    end

    it 'is invalid with a name that has more than 10 characters' do
      list = build(:list, name: "aaaaaaaaaaa")
      list.valid?
      expect(list.errors[:name][0]).to include("は10文字以内で入力してください")
    end

    it 'is valid with a name that has 10 characters' do
      list = build(:list, name: "aaaaaaaaaa")
      expect(list).to be_valid
    end
  end
end

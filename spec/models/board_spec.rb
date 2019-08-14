require 'rails_helper'
describe Board do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:background) { create(:background) }

  describe '#create' do
    it 'is valid with a name, about, deadline, background, user, team' do
      board = build(:board)
      expect(board).to be_valid
    end

    it 'is invalid without a name' do
      board = build(:board, name: "")
      board.valid?
      expect(board.errors[:name]).to include("を入力してください")
    end

    it 'is invalid with a name that has more than 20 characters' do
      board = build(:board, name: "aaaaaaaaaaaaaaaaaaaaa")
      board.valid?
      expect(board.errors[:name][0]).to include("は20文字以内で入力してください")
    end

    it 'is valid with a name that has 20 characters' do
      board = build(:board, name: "aaaaaaaaaaaaaaaaaaaa")
      expect(board).to be_valid
    end

    it 'is invalid without a background' do
      board = build(:board, background_id: nil)
      board.valid?
      expect(board.errors[:background_id]).to include("を入力してください")
    end

    it 'is valid without a team' do
      board = build(:board, team_id: "")
      expect(board).to be_valid
    end
  end
end

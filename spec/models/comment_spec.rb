require 'rails_helper'
describe Comment do
  let(:user) { create(:user) }
  let(:team) { create(:team) }

  describe '#create' do
    it 'is valid with a text, user, card' do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it 'is invalid without a text' do
      comment = build(:comment, text: "")
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end

    it 'is invalid with a text that has more than 30 characters' do
      comment = build(:comment, text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      comment.valid?
      expect(comment.errors[:text][0]).to include("は30文字以内で入力してください")
    end

    it 'is valid with a name that has 30 characters' do
      comment = build(:comment, text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(comment).to be_valid
    end
  end
end

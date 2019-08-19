require 'rails_helper'

describe 'board', type: :system do
  let(:user) {create(:user)}
  let(:board) {create(:board)}
  
  before do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[data-disable-with="Log in"]').click
  end

  context 'when log in' do
    it "can create board" do
      expect {
        click_on('navbarDropdown')
        click_link('Board')
        expect(current_path).to eq new_board_path
        fill_in 'board_name', with: "board1"
        select 'Personal', from: 'board[team_id]'
        choose 'board_background_id_1', visible: false
        find('input[type="submit"]').click
      }.to change(Board, :count).by(1)
    end
    
    it "can edit board" do
      visit edit_board_path(board)
      fill_in 'Name', with: board.name
      select 'Personal', from: 'board[team_id]'
      choose 'board_background_id_1', visible: false
      find('input[type="submit"]').click
      expect(page).to have_content 'ボードを更新しました。'
    end

    it "can delete board" do
      visit board_path(board)
      click_on('Board Menu')
      click_link('Delete Board')
      click_on('DELETE')
      expect(page).to have_content "ボードを削除しました。"
    end
  end
end

require 'rails_helper'

feature 'board', type: :feature do
  let(:user) {create(:user)}

  scenario 'post board' do
    visit root_path
    expect(page).to have_no_content('Add')
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[data-disable-with="Log in"]').click
    expect(current_path).to eq user_path(user)
    expect(page).to have_content('Add')

    expect {
      click_link('Board')
      expect(current_path).to eq new_board_path
      fill_in 'board_name', with: "board1"
      select 'Personal', from: 'board[team_id]'
      choose 'board_background_id_1', visible: false
      find('input[type="submit"]').click
    }.to change(Board, :count).by(1)
  end
end

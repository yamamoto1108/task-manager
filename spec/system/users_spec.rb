require 'rails_helper'

describe 'user', type: :system do
  let!(:user)  {create(:user)}

  context 'sign up user' do
    it 'can sign up' do
      expect do
        visit root_path
        expect(page).to have_content('Sign up')
        visit new_user_registration_path
        fill_in 'user_name', with: 'testuser'
        fill_in 'user_email', with: 'test@gmail.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        find('input[data-disable-with="Sign up"]').click
        expect(page).to have_content 'アカウント登録が完了しました。'
      end.to change { User.count }.by(1)
    end

    it 'cannot sign up' do
      visit root_path
      expect(page).to have_content('Sign up')
      visit new_user_registration_path
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      find('input[data-disable-with="Sign up"]').click
      expect(page).to have_content 'を入力してください'
    end
  end

  context 'log in and log out user' do
    it 'can log in and log out' do
      visit root_path
      expect(page).to have_content('Log in')
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input[data-disable-with="Log in"]').click
      expect(current_path).to eq user_path(user)
      expect(page).to have_content 'ログインしました'
  
      click_on('Logout')
      expect(page).to have_content 'ログアウトしました'
    end

    it 'can not log in' do
      visit root_path
      expect(page).to have_content('Log in')
      visit new_user_session_path
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: user.password
      find('input[data-disable-with="Log in"]').click
      expect(page).to have_content 'もしくはパスワードが不正です'
    end
  end

  context 'when log in' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      find('input[data-disable-with="Log in"]').click
    end
    it 'can edit user' do
      visit edit_user_registration_path
      fill_in 'user_name', with: 'testuser'
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_current_password', with: user.password
      click_on 'Update'
      expect(page).to have_content 'アカウント情報を変更しました。'
    end

    it 'show user mypage' do
      visit user_path(user)
      expect(page).to have_content user.name
    end
  end

  context 'do not log in' do
    it 'can not show mypage' do
      visit user_path(user)
      expect(page).to have_content 'アカウント登録もしくはログインしてください'
    end

    it 'can not edit user' do
      visit edit_user_registration_path
      expect(page).to have_content 'アカウント登録もしくはログインしてください'
    end
  end
end

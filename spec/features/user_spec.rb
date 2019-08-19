require 'rails_helper'

feature 'user', type: :feature do
  let(:user) {create(:user)}

  scenario 'sign up user' do
    visit root_path
    expect(page).to have_content('Sign up')
    visit new_user_registration_path
    fill_in 'user_name', with: 'testuser'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    find('input[data-disable-with="Sign up"]').click
    expect(page).to have_content 'アカウント登録が完了しました。'
  end

  scenario 'can not sign up user' do
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

  scenario 'log in user' do
    visit root_path
    expect(page).to have_content('Log in')
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[data-disable-with="Log in"]').click
    expect(current_path).to eq user_path(user)
    expect(page).to have_content 'ログインしました'
  end

  scenario 'can not log in user' do
    visit root_path
    expect(page).to have_content('Log in')
    visit new_user_session_path
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: user.password
    find('input[data-disable-with="Log in"]').click
    expect(page).to have_content 'もしくはパスワードが不正です'
  end

  scenario 'edit user' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[data-disable-with="Log in"]').click

    visit edit_user_registration_path(user)
    fill_in 'user_name', with: 'testuser'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_current_password', with: user.password
    click_on 'Update'
    expect(page).to have_content 'アカウント情報を変更しました。'
  end

end

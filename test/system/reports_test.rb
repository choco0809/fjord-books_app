# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @steve = create(:user)
    @reports = create(:report, user: @steve)
    visit root_url
    fill_in 'Eメール', with: @steve.email
    fill_in 'パスワード', with: @steve.password
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'
    fill_in 'タイトル', with: @reports.title
    fill_in '内容', with: @reports.content
    click_on '登録する'
    assert_text '日報１'
    assert_text '初めての日報です。'
    assert_text '日報が作成されました。'
    click_on '戻る'
  end

  test 'updating a Report' do
    visit reports_url
    click_link '編集', match: :prefer_exact
    fill_in 'タイトル', with: 'steveの日報です'
    fill_in '内容', with: '内容を更新しました。'
    click_on '更新する'
    assert_text 'steveの日報です'
    assert_text '内容を更新しました。'
    assert_text '日報が更新されました。'
    click_on '戻る'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end
    assert_text '日報が削除されました'
  end
end

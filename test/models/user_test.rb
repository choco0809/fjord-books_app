# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @steve = create(:user)
    @david = create(:user)
  end

  test 'ユーザー名が存在している時、ユーザー名を返す' do
    @steve.name = 'steve'
    assert_equal 'steve', @steve.name_or_email
  end

  test 'ユーザー名が存在しない時、メールアドレスを返す' do
    assert_equal @steve.email, @steve.name_or_email
  end

  test 'SteveをDavidがフォローした場合' do
    @david.follow(@steve)
    assert @david.following?(@steve)
  end

  test 'DavidがSteveのフォローを解除した場合' do
    @david.follow(@steve)
    @david.unfollow(@steve)
    assert_not @david.following?(@steve)
  end

  test 'SteveがDavidにフォローされている場合' do
    @david.follow(@steve)
    assert @steve.followed_by?(@david)
  end

  test 'SteveがDavidにフォローされていない場合' do
    assert_not @steve.followed_by?(@david)
  end
end

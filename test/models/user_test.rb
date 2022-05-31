# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @Steve = create(:user)
    @David = create(:user)
  end

  test 'ユーザー名が存在している時、ユーザー名を返す' do
    @Steve.name = 'steve'
    assert_equal 'steve', @Steve.name_or_email
  end

  test 'ユーザー名が存在しない時、メールアドレスを返す' do
    assert_equal @Steve.email, @Steve.name_or_email
  end

  test 'SteveをDavidがフォローした場合' do
    @David.follow(@Steve)
    assert @David.following?(@Steve)
  end

  test 'DavidがSteveのフォローを解除した場合' do
    @David.follow(@Steve)
    @David.unfollow(@Steve)
    assert_not @David.following?(@Steve)
  end

  test 'SteveがDavidにフォローされている場合' do
    @David.follow(@Steve)
    assert @Steve.followed_by?(@David)
  end

  test 'SteveがDavidにフォローされていない場合' do
    assert_not @Steve.followed_by?(@David)
  end
end

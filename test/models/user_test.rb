# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @steve = create(:user, name: 'steve')
    @david = create(:user, name: 'david')
    @no_name_user = create(:user, name: nil)
  end

  test 'ユーザー名が存在している時、ユーザー名を返す' do
    assert_equal @steve.name, @steve.name_or_email
  end

  test 'ユーザー名が存在しない時、メールアドレスを返す' do
    assert_equal @no_name_user.email, @no_name_user.name_or_email
  end

  test 'SteveをDavidがフォローした場合' do
    assert_equal @david.follow(@steve), Relationship.find_by(follower: @david)
  end

  test 'DavidがSteveのフォローを解除した場合' do
    create(:relationship, following: @steve, follower: @david)
    assert_nil @steve.unfollow(@david)
  end

  test 'SteveがDavidにフォローされている場合' do
    create(:relationship, following: @steve, follower: @david)
    assert @steve.followed_by?(@david)
  end

  test 'SteveがDavidにフォローされていない場合' do
    assert_not @steve.followed_by?(@david)
  end
end

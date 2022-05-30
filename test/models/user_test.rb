# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @me = users(:steve)
    @he = users(:david)
  end

  test 'ユーザー名が存在している時、ユーザー名を返す' do
    assert_equal 'steve', @me.name_or_email
  end

  test 'ユーザー名が存在しない時、メールアドレスを返す' do
    assert_equal 'david@example.com', @he.name_or_email
  end

  test 'あるユーザー(he)を別ユーザー(me)がフォローした場合' do
    @me.follow(@he)
    assert @me.following?(@he)
  end

  test 'あるユーザー(he)がフォローしているユーザー(me)のフォローを解除した場合' do
    @he.follow(@me)
    @he.unfollow(@me)
    assert_not @he.following?(@me)
  end

  test 'あるユーザー(he)がフォローしていないユーザー(me)のフォローを解除した場合' do
    @he.unfollow(@me)
    assert_not @he.following?(@me)
  end

  test 'あるユーザー（me）が特定のユーザー（he）にフォローされている場合' do
    @he.follow(@me)
    assert @me.followed_by?(@he)
  end

  test 'あるユーザー（he）が特定のユーザー（me）にフォローされていない場合' do
    assert_not @me.followed_by?(@he)
  end

  test 'あるユーザー（he）が特定のユーザー（me）をフォローしている場合' do
    @he.follow(@me)
    assert @he.following?(@me)
  end

  test 'あるユーザー（he）が特定のユーザー（me）をフォローしていない場合' do
    assert_not @he.following?(@me)
  end

end

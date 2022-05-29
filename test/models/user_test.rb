# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'ユーザー名が存在している時、ユーザー名を返す' do
    user = users(:steve)
    assert_equal 'steve', user.name_or_email
  end

  test 'ユーザー名が存在しない時、メールアドレスを返す' do
    user = users(:david)
    assert_equal 'david@example.com', user.name_or_email
  end

  test 'あるユーザーを別ユーザーをフォローした場合' do
    me = users(:steve)
    he = users(:david)
    assert me.follow(he)
  end

  test '既にフォローしているユーザーをフォロー解除した場合' do
    me = users(:steve)
    he = users(:david)
    me.follow(he)
    assert me.unfollow(he)
  end

  test 'フォローしていないユーザーをフォロー解除した場合' do
    me = users(:steve)
    he = users(:david)
    assert_not me.unfollow(he)
  end

  test '新規ユーザーをフォローした場合' do
    me = users(:steve)
    he = users(:david)
    assert me.follow(he)
  end

  test '既にフォローしているユーザーをフォローした場合' do
    me = users(:steve)
    he = users(:david)
    me.follow(he)
    assert me.follow(he)
  end

  test 'あるユーザが特定のユーザーにフォローされている場合' do
    me = users(:steve)
    he = users(:david)
    he.follow(me)
    assert me.followed_by?(he)
  end

  test 'あるユーザが特定のユーザーにフォローされていない場合' do
    me = users(:steve)
    he = users(:david)
    assert_not me.followed_by?(he)
  end

  test 'あるユーザーが特定のユーザーをフォローしている時' do
    me = users(:steve)
    he = users(:david)
    me.follow(he)
    assert me.following?(he)
  end

  test 'あるユーザーが特定のユーザーをフォローしていない' do
    me = users(:steve)
    he = users(:david)
    assert_not me.following?(he)
  end

end

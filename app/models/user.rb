# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar  
  # フォロー
  has_many :following_user, class_name: "FollowsRelationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :following_user, source: :followed
  # フォロワー
  has_many :follower_user, class_name: "FollowsRelationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :follower_user, source: :follower

  def follow(user_id)
    following_user.create(followed_id: user_id)
  end

  def unfollow(user_id)
    following_user.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end

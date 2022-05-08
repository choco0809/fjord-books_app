# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :postal_code, format: { with: /[0-9]{7}/, message: 'は数字を入力してください'}
  validates :postal_code, length: { is: 7 }
  #validates :postal_code, format: { with: /\A[a-zA-Z]+\z/}
end

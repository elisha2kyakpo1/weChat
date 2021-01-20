# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email, :username

  has_many :comments, through: :post
  has_many :posts, foreign_key: true
end

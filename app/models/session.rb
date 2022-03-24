class Session < ApplicationRecord
  belongs_to :theme
  has_many :groups
  has_many :user_sessions
  has_many :users, through: :user_sessions
  has_many :user_theme_sessions
end

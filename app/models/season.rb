class Season < ApplicationRecord
  belongs_to :theme
  has_many :groups
  has_many :user_seasons
  has_many :users, through: :user_seasons
  has_many :user_theme_seasons
end
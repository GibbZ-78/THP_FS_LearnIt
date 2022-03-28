class UserThemeSeason < ApplicationRecord
  belongs_to :season
  belongs_to :user  
  has_many :user_theme_season_chapters
end

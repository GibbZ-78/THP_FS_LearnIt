class UserThemeSessionChapter < ApplicationRecord
  belongs_to :user_theme_season
  has_many :user_theme_season_chapter_courses    
end

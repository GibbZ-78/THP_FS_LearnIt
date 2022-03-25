class UserThemeSeasonChapter < ApplicationRecord
  belongs_to :user_theme_season
  has_many :utsc_courses    
end

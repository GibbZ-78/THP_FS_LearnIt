class UserThemeSessionChapter < ApplicationRecord
  belongs_to :user_theme_session
  has_many :user_theme_session_chapter_courses    
end

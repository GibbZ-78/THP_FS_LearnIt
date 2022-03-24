class UserThemeSession < ApplicationRecord
  belongs_to :session
  belongs_to :user  
  has_many :user_theme_session_chapters
end

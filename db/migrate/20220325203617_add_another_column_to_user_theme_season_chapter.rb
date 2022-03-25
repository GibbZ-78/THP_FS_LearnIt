class AddAnotherColumnToUserThemeSeasonChapter < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_theme_season_chapters, :chapter, foreign_key: true
  end
end

class AddColumnsToUserThemeSeasonChapter < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_theme_season_chapters, :user_theme_season, foreign_key: true
    add_column :user_theme_season_chapters, :completion_rate, :integer
  end
end

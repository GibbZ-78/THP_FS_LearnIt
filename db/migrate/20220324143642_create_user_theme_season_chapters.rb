class CreateUserThemeSeasonChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :user_theme_season_chapters do |t|

      t.timestamps
    end
  end
end

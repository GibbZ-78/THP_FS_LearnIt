class AddColumnsToUserThemeSeason < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_theme_seasons, :user, foreign_key: true
    add_reference :user_theme_seasons, :season, foreign_key: true
    add_column :user_theme_seasons, :completion_rate, :integer
  end
end

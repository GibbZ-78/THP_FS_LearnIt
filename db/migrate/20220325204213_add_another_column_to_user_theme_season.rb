class AddAnotherColumnToUserThemeSeason < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_theme_seasons, :theme, foreign_key: true
  end
end

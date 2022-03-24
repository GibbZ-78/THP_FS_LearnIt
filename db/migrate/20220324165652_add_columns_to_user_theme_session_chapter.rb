class AddColumnsToUserThemeSessionChapter < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_theme_session_chapters, :user_theme_session, foreign_key: true
    add_column :user_theme_session_chapters, :completion_rate, :integer
  end
end

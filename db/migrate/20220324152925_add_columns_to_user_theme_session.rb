class AddColumnsToUserThemeSession < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_theme_sessions, :user, foreign_key: true
    add_reference :user_theme_sessions, :session, foreign_key: true
    add_column :user_theme_sessions, :completion_rate, :integer
  end
end

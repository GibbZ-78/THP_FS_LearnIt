class CreateUserThemeSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_theme_sessions do |t|

      t.timestamps
    end
  end
end

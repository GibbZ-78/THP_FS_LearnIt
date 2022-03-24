class CreateUserThemeSessionChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :user_theme_session_chapters do |t|

      t.timestamps
    end
  end
end

class CreateUserThemeSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_theme_seasons do |t|

      t.timestamps
    end
  end
end

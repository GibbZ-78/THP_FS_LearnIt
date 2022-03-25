class CreateUserSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_seasons do |t|
      t.belongs_to :user, index: true
      t.belongs_to :season, index: true
      t.timestamps
    end
  end
end
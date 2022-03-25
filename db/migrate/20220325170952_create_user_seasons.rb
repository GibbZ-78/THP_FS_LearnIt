class CreateUserSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_seasons do |t|
      belongs_to :user
      belongs_to :season
      t.timestamps
    end
  end
end
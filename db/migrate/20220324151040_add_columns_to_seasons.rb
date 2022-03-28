class AddColumnsToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :name, :string
    add_column :seasons, :start_date, :datetime
    add_column :seasons, :end_date, :datetime
    add_reference :seasons, :theme, foreign_key: true
  end
end

class AddColumnsToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :name, :string
    add_column :sessions, :start_date, :datetime
    add_column :sessions, :end_date, :datetime
    add_reference :sessions, :theme, foreign_key: true
  end
end

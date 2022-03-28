class AddColumnsToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :seasons, foreign_key: true
    add_reference :groups, :user, foreign_key: true
  end
end
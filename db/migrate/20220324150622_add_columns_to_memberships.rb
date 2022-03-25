class AddColumnsToMemberships < ActiveRecord::Migration[5.2]
  def change
    add_reference :memberships, :user, foreign_key: true
    add_column :memberships, :subscription_date, :datetime
  end
end

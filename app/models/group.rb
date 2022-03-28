class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups      # Users as Students > members of the group
  belongs_to :season
  belongs_to :user       #Mentor
end

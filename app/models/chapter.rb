class Chapter < ApplicationRecord
  belongs_to :theme
  has_many :courses
end

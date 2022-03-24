class Course < ApplicationRecord
  belongs_to :chapter
  has_one :quiz
end
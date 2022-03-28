class Quiz < ApplicationRecord
  belongs_to :course
  has_many :question_answers
end

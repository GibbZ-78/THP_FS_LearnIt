class Theme < ApplicationRecord
  has_many :sessions
  has_many :chapters
end

class Theme < ApplicationRecord
  has_many :seasons
  has_many :chapters
end

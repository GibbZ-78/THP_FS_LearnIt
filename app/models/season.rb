class Season < ApplicationRecord
  belongs_to :theme
  has_many :groups
  has_many :user_seasons
  has_many :users, through: :user_seasons
  has_many :user_theme_seasons

  def is_started?
    self.start_date < Time.now()
  end
  
  def is_ended?
    self.end_date < Time.now()
  end

  def is_joinable?
    self.is_started? && !self.is_ended?
  end

  def start_in?
    days = self.start_date - Time.now()
    days.to_i / 60 / 60 / 24
  end

end
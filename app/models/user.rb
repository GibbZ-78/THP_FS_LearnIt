class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:student, :mentor, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :user_seasons
  has_many :seasons, through: :user_seasons

  # Return the role of a given "User" object
  def what_role?
    return self.role
  end

  private

  def set_default_role
    self.role ||= :student
  end

end

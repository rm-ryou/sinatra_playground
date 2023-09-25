class User < ActiveRecord::Base
  has_many :todos

  validates :name, presence: true, uniqueness: true
end

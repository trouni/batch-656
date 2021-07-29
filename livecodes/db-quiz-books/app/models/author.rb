class Author < ActiveRecord::Base
  has_many :books
  has_many :readings, through: :books
  has_many :users, through: :readings

  validates :name, presence: true
end
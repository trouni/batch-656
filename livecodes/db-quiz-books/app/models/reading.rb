class Reading < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  has_one :author, through: :books
end
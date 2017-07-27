class Book < ApplicationRecord
  validates :author, presence: true
  belongs_to :user
end
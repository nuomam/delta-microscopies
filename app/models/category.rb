class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :sub_categories
  has_attachment :photo
end

class SubCategory < ApplicationRecord
  belongs_to :category
  validates :name, presence: true, uniqueness: true
  has_attachment :photo
end

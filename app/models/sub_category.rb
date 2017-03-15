class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :products
  validates :name, presence: true, uniqueness: true
  has_attachment :photo
end

class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :sub_category
  validates :name, presence: true
  validates :supplier, presence: true
  validates :sub_category, presence: true
  has_attachment :photo
end

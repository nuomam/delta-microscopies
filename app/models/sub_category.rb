class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :products
  validates :name, presence: true, uniqueness: true
  has_attachment :photo

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end
end

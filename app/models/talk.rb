class Talk < ApplicationRecord
  validates_presence_of :title, :category, :description
  validates :title, uniqueness: true
end

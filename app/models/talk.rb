class Talk < ApplicationRecord
  validates_presence_of :title, :category, :description
  validates_numericality_of :length_of_talk, {only_integer: true}
end

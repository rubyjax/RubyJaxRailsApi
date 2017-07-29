class Talk < ApplicationRecord
  validates_presence_of :title, :category, :description
  validates_with TitleLengthValidator
  validates_with DescriptionLengthValidator
end

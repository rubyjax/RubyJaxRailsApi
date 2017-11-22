class Talk < ApplicationRecord
  validates_presence_of :title, :category, :description
  validates_with TitleLengthValidator, if: :title_present?
  validates_with DescriptionLengthValidator, if: :description_present?

  def title_present?
    title.present?
  end

  def description_present?
    description.present?
  end
end

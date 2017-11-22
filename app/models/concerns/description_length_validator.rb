class DescriptionLengthValidator < ActiveModel::Validator
  def validate(record)
    description = record.description
    description_words = description.split(' ')

    if description_words.size > 200
      record.errors.add(:description, "has too many words")
    end
  end
end
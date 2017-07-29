class TitleLengthValidator < ActiveModel::Validator
  def validate(record)
    title = record.title
    title_words = title.split(' ')

    if title_words.size > 10
      record.errors.add(:title, "has too many words")
    end
  end
end
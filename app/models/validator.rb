class Validator < ActiveModel::Validator

  def validate(record)
    if record.title != nil
      unless record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top") || record.title.include?("Guess")
        record.errors[:title] << "title is not sufficiently clickbait-y"
      end
    end
  end

end

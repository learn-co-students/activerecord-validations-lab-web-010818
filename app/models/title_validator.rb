class TitleValidator < ActiveModel::Validator
  def validate(post)
    clickbait_words = ["Won't Believe", "Secret", "Guess", "Top"]

    if !post.title.nil?
      if !clickbait_words.any? { |word| post.title.downcase.include?(word.downcase)}
      post.errors[:title] << 'Need to include more clickbait-y words!'
      end
    end
  end
end

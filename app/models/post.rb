class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait?

  def clickbait?

    if title != nil
      to_check = title.downcase.split(" ")
      if to_check.include?("won't" && "believe")
        return
      elsif to_check.include?("secret")
        return
      elsif to_check.include?("top")
        return
      elsif to_check.include?("guess")
        return
      else
        errors.add(:title, "not clickbait")
      end
    else
      errors.add(:title, "not clickbait")
    end
  end
end

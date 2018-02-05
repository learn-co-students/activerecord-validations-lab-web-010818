class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum:250}
  validates :summary, length: {maximum:250}
  validates :category, inclusion: {in: ["Fiction","Non-Fiction"]}

  validate :must_be_clickbait, if:

  def must_be_clickbait
    if title
      clickbait = false
      clickbait_titles = ["Won't Believe","Secret", "Guess"]
      clickbait_titles.each do |phrase|
        if title.downcase.include?(phrase.downcase)
          clickbait = true
        end
      end
      clickbait || if title.downcase.include?("top ")
        if check_num(title) != 0; clickbait = true end
      end
      if !clickbait
        errors.add(:title, "must be clickbait-y")
      end
    end
  end

  def check_num
    top_index = title.split(" ").index("top")
    possible_num = title.split(" ")[top_index.to_i+1]
    possible_num.to_i
  end

end

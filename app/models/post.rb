class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbaity


 def is_clickbaity
   click_bait_phrases = ["Won't Believe", "Secret","Guess"]
   if title == nil || click_bait_phrases.none? {|phrase| self.title.include?(phrase)}
     errors.add(:title, "must be clickbait")
  end
 end

end



# Finally, add a custom validator to Post that ensures
#the title is sufficiently clickbait-y. If the title
#does not contain "Won't Believe", "Secret", "Top
# [number]", or "Guess", the validator should return false.

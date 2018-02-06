class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  # Ruby shorthand: %w(Fiction Non-Fiction) => ["Fiction", "Non-Fiction"]

  @@clickbaits = [
    "Won't Believe",
    "Secret",
    "Top #{0-9}",
    "Guess"
    ]

  def is_clickbait?
    if title
      if !(@@clickbaits.find {|cb| title.include?(cb)})
        self.errors.add(:title, "must be clickbait")
      end
    end
  end
end

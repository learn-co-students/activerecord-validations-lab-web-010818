class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction NonFiction) }
  validate :is_clickbait?

  CLICKBAIT_PARAMS = [/Won't Believe/, /Secret/, /Top/, /Guess/]

  def is_clickbait?
    if CLICKBAIT_PARAMS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { :minimum => 250 }
  validates :summary, length: { :maximum => 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates :clickbait

  custom_titles = ["Won't Believe", "Secret", "Top
[0-9]", "Guess"]

  def clickbait
    if custom_titles.none? do |custom_title|
      custom_title.match title
    end
  end


end

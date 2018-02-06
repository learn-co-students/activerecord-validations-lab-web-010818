class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
  validate :is_clickbait?




  def is_clickbait?
    return false if title == nil
    cb = ["Won't Believe", "Secret", "Top 0", "Top 1", "Top 2", "Top 3", "Top 4", "Top 5", "Top 6", "Top 7", "Top 8", "Top 9", "Top 10", "Guess"]
    catch = []
    title_str = title.scan(/\S/).join('')
    cb.each{|phrase| catch << phrase if title_str.include?(phrase.gsub(" ",""))}
    errors.add(:title, "must be clickbait") if catch.empty?
end

end

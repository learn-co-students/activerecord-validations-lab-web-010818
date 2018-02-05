class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with Validator

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction) }

end

class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 140 }
  
  belongs_to :user
  belongs_to :tweet, counter_cache: true
end

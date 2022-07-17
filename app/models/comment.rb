class Comment < ApplicationRecord
  belongs_to :task
  validates :body, presence: true, length: { maximum: 140 }
end

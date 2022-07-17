class Task < ApplicationRecord
  has_many :comments
  belongs_to :task_list
  validates :content, presence: true, length: { maximum: 50 }
end

class Todo < ApplicationRecord
  enum status: { 'Not Done': 0, 'Done': 1 }
  validates :title, presence: true, length: { minimum: 3 }
end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validates :body, :user_id, presence: true

end

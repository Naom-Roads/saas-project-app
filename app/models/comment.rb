class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validates :body, :user_id, presence: true

  def self.after_initialize
    # code here
  end

  after_initialize do
    TicketStatusJob.set(wait_until: updated_at >= Time.current).perform_later self
  end

  # after_commit(comment) do
  #   if publish_at_previously_changed?
  #
  #   end
  # end

end

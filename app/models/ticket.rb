class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :subject, :description, presence: true
  after_validation :set_ticket_number, on: :create


  after_initialize do
    self.ticket_status = 'New' if self.ticket_status.nil?
  end

  def set_ticket_number
    self.ticket_number = Ticket.order(created_at: :desc).first.ticket_number + 1
  end
  #
  # def after_save_commit do
  #   if update_at_previously_changed?
  #     TicketStatusJob.perform_later self
  #   end
  # end
end

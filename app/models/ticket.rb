class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :subject, :description, presence: true
  after_validation :set_ticket_number, on: :create

  # Adds New status on a ticket upon creation
  after_initialize do
    self.ticket_status = 'New' if self.ticket_status.nil?
  end

  def set_ticket_number
    self.ticket_number = Ticket.order(created_at: :desc).first.ticket_number + 1
  end


end

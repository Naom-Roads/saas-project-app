class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :subject, :description, presence: true
  after_validation :set_ticket_number, on: :create


  def set_ticket_number
    self.ticket_number = Ticket.order(created_at: :desc).first.ticket_number + 1
  end

end

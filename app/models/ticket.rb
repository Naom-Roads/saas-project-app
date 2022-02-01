class Ticket < ApplicationRecord
  belongs_to :user
  validates :subject, :description, presence: true
  after_validation :set_ticket_number, on: :create


  def set_ticket_number
    self.ticket_number = rand(1...1000)
  end

end

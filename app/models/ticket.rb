class Ticket < ApplicationRecord
  belongs_to :user
  validates :subject, :description, presence: true


  # def set_ticket_number
  #   @ticket = Ticket.last
  #   @ticket_number = @ticket[:ticket_number]
  #   @ticket_number.nil? ? @ticket_number = @ticket.id + 1000 : @ticket_number
  # end
  #

end

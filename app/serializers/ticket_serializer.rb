class TicketSerializer < ActiveModel::Serializer
  has_many :comments
  # why does has_many need a method?
  attributes :id, :ticket_number, :ticket_status, :subject, :description
end

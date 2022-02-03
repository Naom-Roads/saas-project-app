class TicketSerializer < ActiveModel::Serializer
  attributes :id, :ticket_number, :ticket_status, :subject, :description

  # Scopes comments to those create by user or admin
  has_many :comments do
    object.comments.where(created_by: current_user) unless user.admin?
  end
end

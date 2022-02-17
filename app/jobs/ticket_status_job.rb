class TicketStatusJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    return if ticket.updated?
    ticket.change_ticket_status

    # Will check if update_at time has changed and if comment is present
    if ticket.update_at > Time.current && comment_id? && (ticket.ticket_status = "New")
      ticket.ticket_status = "In Progress"
    end
  end
end



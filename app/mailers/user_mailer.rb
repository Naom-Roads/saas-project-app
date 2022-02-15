class UserMailer < ApplicationMailer
  default from: 'nrrodrig@zohomail.com'

  # Sends notifications with link to ticket that was updated
  def ticket_comment_email(user, ticket)
    @user = user
    @ticket = ticket
    @url =  ticket_url(@ticket)
    mail(to: @user.email, subject: "A Comment was added to ticket #{@ticket.ticket_number}")
  end

end

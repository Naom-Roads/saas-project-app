class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :updated_at
  attribute :subject, key: :username #I want the subject shown to be the username at the top of the comment, is this correct?
  belongs_to :user
  belongs_to :ticket
  # I get a warning on lines of 4, 5, it states I need a method



end

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :updated_at
  attribute :subject, key: :username #I want the subject shown to be the username at the top of the comment, is this correct?
  belongs_to :user
  belongs_to :ticket




end

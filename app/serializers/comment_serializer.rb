class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :updated_at
  attribute :subject, key: :username # remove
  belongs_to :user
  belongs_to :ticket




end

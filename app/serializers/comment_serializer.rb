class CommentSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :ticket
  # I get a warning on the above line of code, it states I need a method
  attributes :id, :username, :body, :updated_at
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :comments
  has_many :tickets
  # why does has_many need a method?

end

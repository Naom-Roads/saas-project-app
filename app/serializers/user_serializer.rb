class UserSerializer < ActiveModel::Serializer
  has_many :comments
  has_many :tickets
  # why does has_many need a method?
  attributes :id, :username
end

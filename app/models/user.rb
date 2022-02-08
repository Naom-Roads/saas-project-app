class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :tickets
  has_many :comments, dependent: :destroy

  def display_name
    username.nil? ? email.split('@')[0].capitalize : username
  end

end

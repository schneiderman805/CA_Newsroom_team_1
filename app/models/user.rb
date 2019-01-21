class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments
  has_many :transactions
  
  validates_presence_of :first_name, :last_name, :email, :encrypted_password

  enum role: { member: 0, journalist: 1, editor: 2, admin: 3 }

end

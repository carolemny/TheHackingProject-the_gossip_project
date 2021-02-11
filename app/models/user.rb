class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,  uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid email adress" }
  validates :age, presence: true,  numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  belongs_to :city
  has_many :gossips
  #has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  #has_many :join_table_pm_recipients
  #has_many :received_messages, through: :join_table_pm_recipients, source: :private_message 
end

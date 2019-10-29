class User < ApplicationRecord
	validates :email,
      presence: true, #tjr rempli
      uniqueness: true,  #unique
      format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" } #format
    validates :first_name,
      presence: true
    validates :last_name,
      presence: true
    validates :description,
      presence: true,
      length: { minimum: 50, too_short: "50 characters is the minimum allowed" }
    validates :age,
      presence: true,
      numericality: { only_integer: true, greater_than_or_equal_to: 1}
    

	belongs_to :city
	has_many :gossips
	has_many :private_messages
	has_many :join_pms
 
end

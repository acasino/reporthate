class Victim < ApplicationRecord
    has_secure_password

    has_many :incidents
    has_many :volunteers, through: :incidents
    accepts_nested_attributes_for :incidents

    validates :name, :email, presence: true
    validates :email, uniqueness: { case_sensitive: false}
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, confirmation: true, on: :create

end

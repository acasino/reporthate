class Victim < ApplicationRecord
    has_secure_password

    has_many :incidents
    has_many :volunteers, through: :incidents

    validates :name, :email, presence: true
    validates :email, uniqueness: { case_sensitive: false}
    
    validates :password, confirmation: true, on: :create

end

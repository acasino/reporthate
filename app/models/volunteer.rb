class Volunteer < ApplicationRecord
    has_secure_password

    has_many :incidents
    has_many :victims, through: :incidents

end

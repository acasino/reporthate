class Victim < ApplicationRecord
    has_secure_password

    has_many :incidents
    has_many :volunteers, through: :incidents

end

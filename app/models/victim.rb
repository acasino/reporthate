class Victim < ApplicationRecord
    has_many :incidents
    has_many :volunteers, through: :incidents

end

class Volunteer < ApplicationRecord
    has_secure_password

    has_many :incidents
    has_many :victims, through: :incidents
    accepts_nested_attributes_for :incidents

    validates :name, :email, presence: true
    validates :email, uniqueness: { case_sensitive: false}
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, confirmation: true, on: :create

    def volunteered_count
        Incident.all.where(volunteer_id: self.id).count
    end

end

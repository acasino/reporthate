class Incident < ApplicationRecord
  belongs_to :victim
  has_many :volunteers

  validates :description, :location, :request_translator, :request_translator, presence: true

  scope :filter_by_status, -> (status){ where status: "Not Yet Contacted" }

  def volunteered_count
    Incident.all.where(volunteer_id: self.id).count
  end

end


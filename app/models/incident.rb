class Incident < ApplicationRecord
  belongs_to :victim
  has_many :volunteers

  validates :description, :location, :request_translator, :request_translator, presence: true

  scope :not_yet_contacted, -> { where("contact_status = ?", "Not Yet Contacted") }
  scope :not_yet_assigned, -> { where(:volunteer_id => nil) }
  scope :time_occurred_desc, -> { order(time_occurred: :desc)}


end


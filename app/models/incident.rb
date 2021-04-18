class Incident < ApplicationRecord
  belongs_to :victim
  has_many :volunteers

  validates :description, :location, :request_translator, :request_translator, presence: true

  scope :not_yet_contacted, -> { where("contact_status = ?", "Not Yet Contacted") }
  scope :time_occurred_desc, -> { order(time_occurred: :desc)}


end


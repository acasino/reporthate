class Incident < ApplicationRecord
  belongs_to :victim
  has_many :volunteers

  validates :description, :location, :request_translator, :request_translator, presence: true

  scope :not_yet_contacted, -> { where("contact_status = ?", "Not Yet Contacted") }
  scope :not_yet_assigned, -> { where(:volunteer_id => nil) }
  scope :time_occurred_desc, -> { order(time_occurred: :desc)}

  def self.search_by(search_term)
    where("LOWER(location) LIKE :search_term OR LOWER(language) LIKE :search_term",
      search_term: "%#{search_term.downcase}%")
  end

end


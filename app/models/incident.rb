class Incident < ApplicationRecord
  belongs_to :victim
  has_many :volunteers

  validates :description, :location, :request_translator, :request_translator, presence: true

end


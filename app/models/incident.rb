class Incident < ApplicationRecord
  belongs_to :victim
  has_many :volunteers

end

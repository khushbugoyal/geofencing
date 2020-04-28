class Tour < ApplicationRecord
	has_many :locations
  include TourAdmin
end

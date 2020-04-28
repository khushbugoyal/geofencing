class Tour < ApplicationRecord
	has_many :locations, dependent: :nullify
  include TourAdmin
end

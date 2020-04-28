class Location < ApplicationRecord
  belongs_to :tour, optional: true
  has_many :pictures

  validates :name, presence: true, uniqueness: true

  after_create :set_tour

  def set_tour
    if !latitude.blank? and !longitude.blank?
      Tour.all.each do |tour|
        location_point = Geokit::LatLng.new(latitude, longitude)
        service = GeofencingPolygonService.new(tour)
        if service.get_center_polygon.contains?(location_point)
          self.tour_id = tour.id
          self.save
          break
        end
      end
    end
  end
end

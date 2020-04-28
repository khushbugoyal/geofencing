class GeofencingPolygonService
  include Geokit::Geocoders
  attr_reader :tour

  def initialize(tour)
    @tour = tour
  end

  def get_center_polygon
    #create center_polygon
    create_center_polygon
  end

  private

  def create_center_polygon
    #passing lat long of polygon to creat a geokit polygon
    points = []
    tour.polygon_coordinates.each do |coord|
      coord = eval(coord)
      points << Geokit::LatLng.new(coord[:lat], coord[:long])
    end
    center_polygon = Geokit::Polygon.new(points)
  end
end

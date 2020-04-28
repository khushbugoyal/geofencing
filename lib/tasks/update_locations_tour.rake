namespace :locations do

  desc "Updating tour ids into locations using geofencing"
  task update_tour: :environment do
    Tour.all.each do |tour|
      service = GeofencingPolygonService.new(tour)

      locs = Location.where("tour_id is null")

      locs.each do |loc|
        begin
          if loc.latitude.blank? or loc.longitude.blank?
            puts "#{loc.id} - Lat/Long Blank"
          else
            location_point = Geokit::LatLng.new(loc.latitude, loc.longitude)

            if service.get_center_polygon.contains?(location_point)
              loc.tour_id = tour.id
              loc.save
            end
          end
        rescue Exception => ex
          debugger
          puts ex
        end
      end
    end
  end
end

# ##### ONE
# app/models/track.rb
class Track
   belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id
  )
end


# app/models/album.rb
class Album
  belongs_to(
    :artist,
    class_name: "Artist",
    foreign_key: :artist_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    class_name: "Track",
    foreign_key: :album_id,
    primary_key: :id
  )
end


# app/models/artist.rb
class Artist
  has_many(
    :albums,
    class_name: "Album",
    foreign_key: :artist_id,
    primary_key: :id
  )

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.name] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    albums = self.albums.includes(:tracks)
    tracks_count = {}
    albums.each do |album|
      album[tracks] = album.tracks.length
    end

    tracks_count
  end

  # def better_tracks_query
  # albums = self
  #   .albums
  #   .select("albums.*, COUNT(*) AS tracks_count")
  #   .joins(:tracks)
  #   .group("albums.id")
  #
  # album_counts = {}
  # albums.each do |album|
  #   album_counts[album.name] = album.tracks_count
  # end
  #
  # album_counts
  # end
end

# ### TWO
# app/models/gardener.rb
class Gardener
  belongs_to(
    :house,
    class_name: "House",
    foreign_key: :house_id,
    primary_key: :id
  )

  has_many(
    :plants,
    class_name: "Plant",
    foreign_key: :gardener_id,
    primary_key: :id
  )
end


# app/models/plant.rb
class Plant
  belongs_to(
    :gardener,
    class_name: "Gardener",
    foreign_key: :gardener_id,
    primary_key: :id
  )

  has_many(
    :seeds,
    class_name: "Seed",
    foreign_key: :plant_id,
    primary_key: :id
  )
end



# app/models/seed.rb
class Seed
  belongs_to(
    :plant,
    class_name: "Plant",
    foreign_key: :plant_id,
    primary_key: :id
  )
end


# app/models/house.rb
class House
  has_many(
    :gardeners,
    class_name: "Gardener",
    foreign_key: :house_id,
    primary_key: :id
  )

  has_many(
    :plants,
    through: :gardeners,
    source: :plants
  )

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

  def better_seeds_query
    plants = self.plants.includes(:seeds)
    seeds = []
    plants.each {|plant| seeds << plant.seeds}
    seeds
  end
end

# #### THREE

# app/models/driver.rb
class Driver
  belongs_to(
    :bus,
    class_name: "Bus",
    foreign_key: :bus_id,
    primary_key: :id
  )
end


# app/models/bus.rb
class Bus
  belongs_to(
    :route,
    class_name: "Route",
    foreign_key: :route_id,
    primary_key: :id,
  )

  has_many(
    :drivers,
    class_name: "Driver",
    foreign_key: :bus_id,
    primary_key: :id,
  )
end


# app/models/route.rb
class Route
  has_many(
    :buses,
    class_name: "Bus",
    foreign_key: :route_id,
    primary_key: :id
  )

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    buses = self.buses.includes(:drivers)
    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers

  end
end

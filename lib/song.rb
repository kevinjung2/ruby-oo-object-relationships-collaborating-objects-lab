class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    self.name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file_name)
    new = Song.new(file_name.split(" - ")[1])
    new.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    new
  end

  def artist_name=(name)
    new = Artist.find_or_create_by_name(name)
    self.artist = new
  end
end

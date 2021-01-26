class MP3Importer
  attr_accessor :path

  @@files = []

  def initialize(file_path)
    self.path = file_path
    self.files
  end

  def files
    files = Dir.entries(self.path)
    @@files = files.select { |file| file.match(/.*.mp3/) }
  end

  def import
    @@files.each { |file| Song.new_by_filename(file) }
  end
end

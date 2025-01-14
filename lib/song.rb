class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new 
    song.save
    song 
  end 
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    @@all << song 
    song 
  end 

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) :self.create_by_name(name)
  end 
  
  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    rows = filename.split(" - ")
    song = self.new 
    song.name = rows[1].split(".mp3")[0]
    song.artist_name = rows[0] 
    song 
  end 
  
  def self.create_from_filename(mp3_file)
    rows = mp3_file.split(" - ")
    song = self.new 
    song.name = rows[1].split(".mp3")[0]
    song.artist_name = rows[0] 
    @@all << song
  end
  
  def self.destroy_all
    self.all.clear
  end 
end 
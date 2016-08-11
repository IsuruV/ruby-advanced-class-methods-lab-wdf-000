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
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end


  def self.find_or_create_by_name(name)
    if !!self.find_by_name(name) == false
         self.create_by_name(name)

    else
         self.find_by_name(name)
    end
  end


  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = filename.split(" - ")
    artist_name = song[0]
    song_name = song[1].gsub(".mp3","")
    song1 = self.new
    song1.name = song_name
    song1.artist_name = artist_name
    song1
  end

  def self.create_from_filename(filename)
    song = filename.split(" - ")
    artist_name = song[0]
    song_name = song[1].gsub(".mp3","")
    song1 = self.create
    song1.name = song_name
    song1.artist_name = artist_name
    song1
  end


  def self.destroy_all
    @@all.clear
  end


end

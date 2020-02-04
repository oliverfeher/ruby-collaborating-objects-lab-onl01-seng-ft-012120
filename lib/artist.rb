class Artist
    attr_accessor :name
    
    @@all = [] #this is all artists
    
    def initialize(name) # with a name, push all instances into @@all
      @name = name
      @@all << self
    end
    
    def self.all # a reader for all Artist
      @@all
    end
    
    def add_song(song)
      song.artist = self
      song
    end
    
    def songs
      Song.all.select {|song| song.artist == self}
    end
    
    def self.find_or_create_by_name(name)
        new_artist = Artist.all.find { |artist| artist.name == name}
        if new_artist.nil?
            new_artist = Artist.new(name)
        end
        new_artist
    end
    
    def print_songs
     self.songs.each {|song| puts song.name}
    end
  end
  
require 'pry'


class Song

    @@all = []

    attr_accessor :name, :artist


    def initialize(name)
        @name = name
        @@all << self
    end


    def self.all
        @@all
    end


        # creates a new instance of a song from the file that's passed
        # associates new song instance with the artist from the filename

    def self.new_by_filename(filename)
        split_name = filename.split(" - ")
        song = self.new(split_name[1])
        artist = Artist.find_or_create_by_name(split_name[0])
        song.artist = artist
        artist.add_song(song)
        song
      
    end

    def artist_name=(name)
    
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    
    end


end
# binding.pry




# song_name = filename.split(" - ")[1]
# new_song = self.new(song_name)
# new_song.artist_name = filename.split(" - ")[0]
# new_song
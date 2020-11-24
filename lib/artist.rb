require 'pry'

class Artist

    @@all = []

    attr_accessor :name


    def initialize(name)
        @name = name
        @@all << self
    end

        # returns all existing Artist instances
    def self.all
        @@all    
    end
     
        # lists all songs that belong to this artist   

    def songs
        Song.all.select { |s| s.artist == self }
    end

        # keeps track of an artist's songs

    def add_song(song)
        song.artist = self

    end


    # always returns an Artist instance
    # finds or creates an artist by name maintaining uniqueness of objects by name property 
    # Creates new instance of Artist if none exist

    def self.find_or_create_by_name(name)

        self.all.detect { |artist| artist.name == name } || Artist.new(name)

    end
    
    
    def print_songs
		songs.each {|song| puts song.name}
    end



end

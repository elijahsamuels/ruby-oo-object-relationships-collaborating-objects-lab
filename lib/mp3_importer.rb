class MP3Importer

    @@all = []

    attr_accessor :path


    def initialize(filepath)
        @path = filepath
    end

    def files
        @files = Dir.entries(@path)
        @files.delete_if { |file| file == "." || file == ".."}
    end
  
        # imports the files into the library by creating songs from a filename
    def import
        files.each { |f| Song.new_by_filename(f) }
    end





end


    # ./spec/fixtures/mp3s/Real Estate - It's Real - hip-hop.mp3
    # ./spec/fixtures/mp3s/Real Estate - Green Aisles - country.mp3
    # ./spec/fixtures/mp3s/Thundercat - For Love I Come - dance.mp3
    # ./spec/fixtures/mp3s/Action Bronson - Larry Csonka - indie.mp3
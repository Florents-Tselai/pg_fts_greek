# frozen_string_literal: true

module GreekStopwords
  class List
    def initialize
      @antonymies_str = "#{File.dirname(__FILE__)}/parts_of_speech/antonymies.txt"
      @arithmhtika_str = "#{File.dirname(__FILE__)}/parts_of_speech/arithmhtika.txt"
      @arthra_str = "#{File.dirname(__FILE__)}/parts_of_speech/arthra.txt"
      @epifonhmata_str = "#{File.dirname(__FILE__)}/parts_of_speech/epifonhmata.txt"
      @epirrhmata_str = "#{File.dirname(__FILE__)}/parts_of_speech/epirrhmata.txt"
      @moria_str = "#{File.dirname(__FILE__)}/parts_of_speech/moria.txt"
      @protheseis_str = "#{File.dirname(__FILE__)}/parts_of_speech/protheseis.txt"
      @syndesmoi_str = "#{File.dirname(__FILE__)}/parts_of_speech/syndesmoi.txt"
      @rhmata_str = "#{File.dirname(__FILE__)}/parts_of_speech/rhmata.txt"
      @punctuation_str = "#{File.dirname(__FILE__)}/parts_of_speech/punctuation.txt"
      return 'Loaded'
    end

    def all
      @antonymies = File.read(@antonymies_str).split("\n").select{ |item| item unless item.empty? or item.include?("#") }
      @arithmhtika = File.read(@arithmhtika_str).split("\n").select{ |item| item unless item.empty? or item.include?("#") }
      @arthra = File.read(@arthra_str).split("\n").select{ |item| item unless item.empty? or item.include?("#") }
      @epifonhmata = File.read(@epifonhmata_str).split("\n").select{ |item| item unless item.empty? or item.include?("#") }
      @epirrhmata = File.read(@epirrhmata_str).split("\n").select{ |item| item unless item.empty? or item.include?("#") }
      @moria = File.read(@moria_str).split("\n").select{ |item| item unless item.empty? or item.include?("#") }
      @protheseis = File.read(@protheseis_str).split("\n").select{ |item| item unless item.empty? or item.include?("#") }
      @syndesmoi = File.read(@syndesmoi_str).split("\n").select{ |item| item unless item.empty? or item.include?("#") }
      @rhmata = File.read(@rhmata_str).split("\n").select{ |item| item unless item.empty? or item.include?("#") }
      @punctuation = File.read(@punctuation_str).split("\n").select{ |item| item unless item.empty? or item.include?("#") }

      @all = @antonymies + @arithmhtika + @arthra + @epifonhmata + @epirrhmata + @moria + @protheseis + @syndesmoi + @rhmata + @punctuation
      @all.uniq
    end
  end
end

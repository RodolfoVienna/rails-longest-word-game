require "open-uri"
require "json"

class NewgamesController < ApplicationController

  def home
  end

  def new
    @letters = []
    n = 0
    while n < 10
      letter = ('a'..'z').to_a.sample
      @letters << letter
      n += 1
    end
    @letters
  end

  def score
    @word = params[:word]
    @english_word = english(@word)

    @word = params[:word].split("")
    @grid = params[:letters].split
    # The word can not be built out of the original grid
    # grid = ["P", "R", "N", "K", "X", "I", "V", "R", "S", "Z"]
    # @word= "test"
    # CHECK IF EVERY LETTER IN THE @word IS IN THE @grid
    @included = @word.all? { |letter| @grid.include?(letter) }
    @verify = @included && ((@word.count > @grid.count) == false)
  end

  private

  def english(word)
    # The word is valid according to the grid, but is not a valid English word
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json["found"]
  end
end

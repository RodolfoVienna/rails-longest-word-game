# Using the right command line command in the TERMINAL
# ( "rails g controller GamesController")
# generate the GamesController with two
# actions new and score
require "open-uri"


class GamesController < ApplicationController

  def new
    @array = []
    n = 0
    while n < 15
      letter = ('a'..'z').to_a.sample
      @array << letter
      n += 1
    end
   return @array
  end

  def score
    @word = params[:word]
    @result = APIcall(@word)
    @viewres = points
  end

  def APIcall(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json["found"]
  end

  def points
    if @result == false
      @point = 0
    else
      "Bravo"
    end
  end
end

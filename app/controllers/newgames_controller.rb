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
  end

end

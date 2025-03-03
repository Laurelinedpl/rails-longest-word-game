class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
    # @letters = guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }

  end

  def score
    @letter = params[:letter]
    @word = params[:word]
    @word_english = JSON.parse(URI.parse("https://dictionary.lewagon.com/#{@word}").read)

    if @word_english['found'] == true && @word
      @message = "bravo! #{@word} c'est correct!"
    elsif @message = "desolé, mais #{@word} n'est pas valide."
    else
      @message = "desolé, mais #{@word} ne contient pas les #{@letters.join(', ')}."
    end
  end
end

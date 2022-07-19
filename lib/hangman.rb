class Game
  def initialize(tries, list)
    @tries = tries
    @list = list
    @rand_word 
    @player_word
    @guessed_letters
    @letter_turn
  end

  def get_word
    content = File.read(@list)
    listed_words = content.split(" ").select do |word|
      word if word.length >= 5 && word.length <= 12
    end 
    @rand_word = listed_words[rand(listed_words.length)]
  end

  def play
    intro
    while @tries != 0
      p "Tries left #{@tries}"
      turn
      @tries -= 1 if check_try(@letter_turn) != true
      p "Game over, You lose!, The word was #{@rand_word.split("")}" if @tries == 0
    end
  end

  def intro
    get_word
    p "Hello, this the hangman game The game will choose a random word and you'll have to guess correctly"
    p "You have 8 tries, every turn the game will ask you for a letter if the letter is in the word you can keep going"
    p "if the letter does't match you'll lose a try. Good luck!"
    @guessed_letters = Array.new(@rand_word.length).map { |item| item = '-'}
  end

  def turn
    p "What's the letter for this turn?"
    letter = gets.chomp.downcase
    @letter_turn = letter
    populate_guess(letter)
    p @guessed_letters
    game_over
  end


  def populate_guess(letter)
    @rand_word.split("").each_with_index do |item, index|
      @guessed_letters[index] = item  if item == letter
    end
  end

  def game_over
    if @rand_word.split("") == @guessed_letters
      p "You WON!! Congratz!"
      sleep(5)
    end
  end

  def check_try(letter)
    true if @rand_word.count(letter) >= 1
  end
end

new_game = Game.new(8, 'words_list.txt')
new_game.play




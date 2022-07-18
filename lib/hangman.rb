class Game
  def initialize(tries, list)
    @tries = tries
    @list = list
    @rand_word 
    @player_word
  end

  def get_word
    content = File.read(@list)
    listed_words = content.split(" ").select do |word|
      word if word.length >= 5 && word.length <= 12
    end 
    @rand_word = listed_words[rand(listed_words.length)]
  end

  def play
    try = 0
    intro
    while try != @tries
      turn
      p @rand_word
      try += 1
    end
  end

  def intro
    get_word
    p "Hello, this the hangman game The game will choose a random word and you'll have to guess correctly"
    p "You have 8 tries, every turn the game will ask you for a letter if the letter is in the word you can keep going"
    p "if the letter does't match you'll lose a try. Good luck!"
  end

  def turn
    p "What's the letter for this turn?"
    letter = gets.chomp 
    p "letter was #{letter}"
  end
end

new_game = Game.new(8, 'words_list.txt')
new_game.play



class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  
  def initialize
    random = Hangman.random_word
    @secret_word = random
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)

    secretsplit = @secret_word.split('')
    newarr = []
    secretsplit.each_with_index do |ele, idx|
      if char == ele
        newarr << idx
      end
    end
    newarr
  end

  def fill_indices(char, indices)
    indices.each do |idx|
      @guess_word[idx] = char
    end
  end

  def try_guess(char)
    
    if  already_attempted?(char)
      p "that has already been attempted"
      return false
    end

    if !@secret_word.include?(char)
      @remaining_incorrect_guesses -= 1
    end

    @attempted_chars << char

    char_indices = self.get_matching_indices(char)
    self.fill_indices(char, char_indices)
    return true
  end

  def ask_user_for_guess
    p "Enter a char"
    char = gets.chomp
    p self.try_guess(char)
  end

  def win?
    if self.guess_word.join('') == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? == true || self.lose? == true
      p @secret_word
      return true
    end
    if self.lose? == false
      return false
    end
  end

end

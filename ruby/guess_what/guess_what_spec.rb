require_relative "guess_what"

describe GuessWhat do
  let(:game) { GuessWhat.new("Hello world")}

  describe "can be initialized with an input string and start the game" do
    it "stores the phrase given on initialization" do
      expect(game.phrase).to eq "Hello world"
    end

    it "sets when the game will end" do
      expect(game.limit).to eq 10
    end

    it "sets the number of guesses to 0" do
      expect(game.count).to eq 0
    end

    it "creates a log for guesses and sets it to empty" do
      expect(game.guess_history).to be_empty
    end

    it "flags if guesser guessed the phrase correctly" do
      expect(game.guessed).to be false
    end
  end

  describe "can validate an input string" do
    context "when given a valid input string" do
      it "accepts the valid phrase" do
        expect(GuessWhat.new("valid phrase").valid?).to be true
      end
    end

    context "when given an invalid input string" do
      it "rejects the invalid phrase" do
        expect(GuessWhat.new("inval!d phr@se").valid?).to be false
      end
    end
  end

  describe "can transform a phrase into a puzzle" do
    it "can hide all the letters" do
      expect(game.construct_puzzle).to eq "_ _ _ _ _ | _ _ _ _ _"
    end
  end

  describe "can process player input and provides the result" do
    it "determines if the game is over" do
      expect(game.over?).to be false
    end
    describe "validates the guessed letter" do
      context "when a valid letter is submitted" do
        it "updates the guess count" do
          game.valid_letter?("M")
          game.valid_letter?("n")
          expect(game.count).to eq 2
        end

        it "adds the letter to the guess history" do
          game.valid_letter?("m")
          expect(game.guess_history.include?("M")).to be true
        end

        it "confirms that the letter is valid" do
          expect(game.valid_letter?("Q")).to be true
        end
      end

      context "when an invalid letter is submitted" do
        it "rejects if letter is not equal 1 character" do
          expect(game.valid_letter?("8e")).to be false
        end
        it "rejects if letter is not a letter in the alphabet" do
          expect(game.valid_letter?("$")).to be false
        end
      end
    end

    describe "confirms if the letter is in the puzzle" do
      it "it provides the position of the letter in the puzzle" do
        expect(game.match_indexes("l")).to eq [2,3,9]
      end

      it "advises if the letter matched" do
        expect(game.match_indexes("a")).to eq []
      end

      it "updates the puzzle display" do
        game.construct_puzzle
        game.construct_puzzle(game.match_indexes("l"), "l")
        game.construct_puzzle(game.match_indexes("b"), "b")
        expect(game.construct_puzzle(game.match_indexes("w"), "w")).to eq "_ _ L L _ | W _ _ L _"
      end

      it "confirms if the player guessed the phrase correctly" do
        game.check_guess("hello World")
        expect(game.guessed).to be true
      end

      it "rejects if the player guessed the phrase incorrectly" do
        game.check_guess("holly whale")
        expect(game.guessed).to be false
      end
    end
  end
  describe "determines if the guesser won the game" do
    it "says win if player guessed the phrase before the limit number of guesses" do
      game.check_guess("hello world")
      expect(game.won?).to be true
    end

    it "says win if all letters were guessed before the limit number of guesses" do
      game.construct_puzzle
      game.construct_puzzle(game.match_indexes("h"), "h")
      game.construct_puzzle(game.match_indexes("e"), "e")
      game.construct_puzzle(game.match_indexes("l"), "l")
      game.construct_puzzle(game.match_indexes("o"), "o")
      game.construct_puzzle(game.match_indexes("w"), "w")
      game.construct_puzzle(game.match_indexes("r"), "r")
      game.construct_puzzle(game.match_indexes("d"), "d")
      expect(game.won?).to be true
    end
    
    it "says lose if unable to guess and exceeded limit" do
      game.construct_puzzle
      game.construct_puzzle(game.match_indexes("h"), "h")
      game.construct_puzzle(game.match_indexes("e"), "e")
      game.construct_puzzle(game.match_indexes("n"), "n")
      game.construct_puzzle(game.match_indexes("o"), "o")
      game.construct_puzzle(game.match_indexes("q"), "q")
      game.construct_puzzle(game.match_indexes("r"), "r")
      game.construct_puzzle(game.match_indexes("s"), "s")
      game.construct_puzzle(game.match_indexes("m"), "m")
      expect(game.won?).to be false
    end
  end
end

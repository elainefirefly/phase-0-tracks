require_relative "guess_what"

describe GuessWhat do
  let(:game) { GuessWhat.new("hello world")}

  describe "can be initialized with an input string and start the game" do
    it "stores the phrase given on initialization" do
      expect(game.phrase).to eq "hello world"
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
      expect(game.show_puzzle).to eq "_ _ _ _ _ | _ _ _ _ _"
    end
  end

  describe "can process player input and will provide the result" do
    it "determines if the game is over" do
      expect(game.game_over?).to be false
    end
    describe "validates the guessed letter" do
      context "when a valid letter is submitted" do
        it "updates the guess count" do
          game.valid_letter?("M")
          game.valid_letter?("n")
          expect(game.count).to eq 2
        end

        it "adds the letter to the guess history" do
          game.valid_letter?("M")
          expect(game.guess_history.include?("m")).to be true
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
        game.show_puzzle
        game.show_puzzle(game.match_indexes("l"), "l")
        game.show_puzzle(game.match_indexes("b"), "b")
        expect(game.show_puzzle(game.match_indexes("w"), "w")).to eq "_ _ l l _ | w _ _ l _"
      end
    end
  end
end

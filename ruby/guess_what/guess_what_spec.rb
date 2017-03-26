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

    it "creates a list for guesses and sets it to empty" do
      expect(game.guesses).to be_empty
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
end

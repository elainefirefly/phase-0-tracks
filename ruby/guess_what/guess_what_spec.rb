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
end

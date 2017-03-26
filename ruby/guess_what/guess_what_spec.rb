require_relative "guess_what"

describe GuessWhat do
  let(:game) { GuessWhat.new("hello world")}

  describe "can be initialized with an input string and start the game" do
    it "stores the phrase given on initialization" do
      expect(game.phrase).to eq "hello world"
    end

    it "sets the game in progress" do
      expect(game.game_over).to be false
    end

    it "sets when the game will end" do
      expect(game.guess_limit).to eq 10
    end

    it "sets the number of guesses to 0" do
      expect(game.guess_count).to eq 0
    end

    it "creates a list for guesses and sets it to empty" do
      expect(game.guess_list).to be_empty
    end
  end
end

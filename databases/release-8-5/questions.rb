require "json"
require "open-uri"

class Questions
  OPENTDB_BEGIN_URL = "https://opentdb.com/api.php?amount="
  private_constant :OPENTDB_BEGIN_URL

  def initialize(category, difficulty)
    @category = category
    @difficulty = difficulty
  end

  def generate(quantity)
    url = construct_url(quantity)
    obj = URI.parse(url).read
    @questions_hash = JSON.parse(obj)
    puts @questions_hash
  end

  def construct_url(quantity)
    "#{OPENTDB_BEGIN_URL}#{quantity}&#{category}&difficulty=#{difficulty}&type=multiple"
    #"https://opentdb.com/api.php?amount=1&category=9&difficulty=easy&type=multiple"
  end

  def next_question(number)
    @questions_hash["results"][number]["question"]
    #maybe create a cure string method to fix the encoding error
  end

  def give_choices(number)
    choices = @questions_hash["results"][number]["incorrect_answers"]
    @idx_answer = rand(4)
    choices.insert(@idx_answer, @questions_hash["results"][number]["correct_answer"])
  end

  def reveal_answer
    @idx_answer
  end
end

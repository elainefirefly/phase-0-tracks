require "json"
require "open-uri"

class Questions

  def initialize(category, difficulty)
    @category = category
    @difficulty = difficulty
  end

  def generate
    url = construct_url
    obj = URI.parse(url).read
    puts obj.encoding
    obj.force_encoding('UTF-8')
    puts obj.encoding
    @questions_hash = JSON.parse(obj)
    puts @questions_hash
  end

  def construct_url
    "https://opentdb.com/api.php?amount=1&category=9&difficulty=easy&type=multiple"
  end

  def next_question(number)
    @questions_hash["results"][number]["question"]
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

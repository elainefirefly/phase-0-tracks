require "httparty"

class Questions
  OPENTDB_BEGIN_URL = "https://opentdb.com/api.php?amount="
  private_constant :OPENTDB_BEGIN_URL

  def initialize(category, difficulty)
    @category = category
    @difficulty = difficulty
  end

  def generate(quantity)
    url = construct_url(quantity)
    @questions_hash = HTTParty.get(url).parsed_response
  end

  def construct_url(quantity)
    "#{OPENTDB_BEGIN_URL}#{quantity}&category=#{@category}&difficulty=#{@difficulty}&type=multiple"
    #"https://opentdb.com/api.php?amount=1&category=9&difficulty=easy&type=multiple"
  end

  def cure_text(text)
    weird_char = { "&#039;" => "'",
                   "&quot;" => "\"",
                    "&amp;" => "&"
    }
    if text.is_a? String
      weird_char.each { |code,symbol| text.gsub!(code,symbol) }
    else
      text.each_with_index do |phrase,i|
        weird_char.each { |code,symbol| phrase.gsub!(code,symbol) }
      end
    end
    text
  end

  def next_question(number)
    question = @questions_hash["results"][number]["question"]
    question.insert(50,"\n") if question.length > 50
    cure_text(question)
  end

  def give_choices(number)
    choices = @questions_hash["results"][number]["incorrect_answers"]
    @idx_answer = rand(4)
    choices.insert(@idx_answer, @questions_hash["results"][number]["correct_answer"])
    cure_text(choices)
  end

  def reveal_answer
    @idx_answer
  end
end

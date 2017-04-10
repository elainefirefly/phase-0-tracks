class GameAnalyzer
  def initialize(data)
    @data = data
  end

  def best_streak(level)
     key = case level
     when "easy" then "easy_streak"
     when "medium" then "med_streak"
     when "hard" then "hard_streak"
     end
     @data[key]
  end

  def performance_overall
    total_quest = @data["general_questions"] + @data["computer_questions"] + @data["history_questions"]
    total_corr = @data["general_correct"] + @data["computer_correct"] + @data["history_correct"]
    (total_corr / total_quest).round
  end



  def general_performance
      
  end

  def computer_performance
  end

  def history_performance
  end

  def report_summary

  end
end

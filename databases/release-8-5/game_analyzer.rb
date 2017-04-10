class GameAnalyzer
  def initialize(data)
    @data = data
  end

  def get_best_streak(level)
     key = case level
     when "easy" then "easy_streak"
     when "medium" then "med_streak"
     when "hard" then "hard_streak"
     end
     @data[0][key]
  end

  def performance_overall
    @total_quest = @data[0]["general_questions"] + @data[0]["computer_questions"] + @data[0]["history_questions"]
    @total_corr = @data[0]["general_correct"] + @data[0]["computer_correct"] + @data[0]["history_correct"]
    return 0 if @total_quest == 0
    (@total_corr.fdiv(@total_quest) * 100).round
  end

  def general_performance
    return 0 if @data[0]["general_questions"] == 0
    (@data[0]["general_correct"].fdiv(@data[0]["general_questions"]) * 100).round
  end

  def computer_performance
    return 0 if @data[0]["computer_questions"] == 0
    (@data[0]["computer_correct"].fdiv(@data[0]["computer_questions"]) * 100).round
  end

  def history_performance
    return 0 if @data[0]["history_questions"] == 0
    (@data[0]["history_correct"].fdiv(@data[0]["history_questions"]) * 100).round
  end

  def report_summary
    <<-SUMMARY
    Best Streak:
    Easy                  #{get_best_streak("easy")}
    Medium                #{get_best_streak("medium")}
    Hard                  #{get_best_streak("hard")}

    Overall Performance:   #{performance_overall}%
    General Knowledge      #{general_performance}%
    Computer               #{computer_performance}%
    History                #{history_performance}%

    Total Questions:       #{@total_quest}
    Total Correct Answers: #{@total_corr}
    SUMMARY
  end
end

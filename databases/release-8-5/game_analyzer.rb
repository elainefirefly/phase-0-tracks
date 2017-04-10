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
    @total_quest = @data["general_questions"] + @data["computer_questions"] + @data["history_questions"]
    @total_corr = @data["general_correct"] + @data["computer_correct"] + @data["history_correct"]
    return 0 if @total_quest == 0
    (@total_corr.fdiv(@total_quest) * 100).round
  end

  def general_performance
    return 0 if @data["general_questions"] == 0
    (@data["general_correct"].fdiv(@data["general_questions"]) * 100).round
  end

  def computer_performance
    return 0 if @data["computer_questions"] == 0
    (@data["computer_correct"].fdiv(@data["computer_questions"]) * 100).round
  end

  def history_performance
    return 0 if @data["history_questions"] == 0
    (@data["history_correct"].fdiv(@data["history_questions"]) * 100).round
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

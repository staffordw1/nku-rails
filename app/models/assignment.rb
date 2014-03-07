class Assignment < ActiveRecord::Base
  
  def percentage
    (score.to_d / total * 100).round
  end
  
  def self.average_percentage
    sum_score = sum('score')
    sum_total = sum('total')
    return (sum_score.to_d / sum_total * 100).round
  end
  
  
end
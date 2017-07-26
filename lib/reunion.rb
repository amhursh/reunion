require './lib/activity'

class Reunion

  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    activities << activity
  end

  def total_cost
    activities.inject(0) do |sum, activity|
      sum + activity.total_cost
    end
  end

  def breakout
    owed_info = activities.map do |activity|
      activity.owed
    end
    total_owed = owed_info[0].merge(owed_info[1]) do |participant, owed_1, owed_2|
      owed_1 + owed_2
    end
    total_owed
  end

  def print_summary
    breakout.each do |k, v|
      puts "#{k}: #{v}"
    end
  end

end

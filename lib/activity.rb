class Activity

  attr_reader :name,
              :participants

  def initialize(name)
    @name         = name
    @participants = {}
  end

  def add_participant(name, cost)
    participants[name] = cost
  end

  def total_cost
    participants.values.inject(0) do |sum, cost|
      sum + cost
    end
  end

  def split
    participants_count = participants.count
    total_cost / participants_count
  end

  def owed
    ammount_owed = {}
    participants.each do |participant, cost|
      ammount_owed[participant] = split - cost
    end
    ammount_owed
  end

end

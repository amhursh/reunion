require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require 'pry'

class ReunionTest < Minitest::Test

  def test_reunion_exists
    reunion = Reunion.new("Denver")

    assert_instance_of Reunion, reunion
  end

  def test_reunion_has_name
    reunion = Reunion.new("Denver")

    assert_equal "Denver", reunion.name
  end

  def test_reunion_has_no_activities_to_start
    reunion = Reunion.new("Denver")

    assert_equal [], reunion.activities
  end

  def test_reunion_can_add_activities
    reunion = Reunion.new("Denver")
    act = Activity.new("Brunch")
    act.add_participant("Jim", 20)
    act.add_participant("Joe", 40)
    reunion.add_activity(act)

    assert_equal 1, reunion.activities.count
  end

  def test_reunion_can_access_total_cost
    reunion = Reunion.new("Denver")
    act = Activity.new("Brunch")
    act.add_participant("Jim", 20)
    act.add_participant("Joe", 40)
    reunion.add_activity(act)

    assert_equal 60, reunion.total_cost

    act_2 = Activity.new("Drinks")
    act_2.add_participant("Jim", 60)
    act_2.add_participant("John", 80)
    reunion.add_activity(act_2)

    assert_equal 200, reunion.total_cost
  end

  def test_reunion_has_breakout
    reunion = Reunion.new("Denver")
    act = Activity.new("Brunch")
    act.add_participant("Jim", 20)
    act.add_participant("Joe", 40)
    act_2 = Activity.new("Drinks")
    act_2.add_participant("Jim", 60)
    act_2.add_participant("John", 80)
    reunion.add_activity(act)
    reunion.add_activity(act_2)

    assert_equal ({"Jim"=> 20, "Joe"=> -10, "John"=> -10}), reunion.breakout
  end

  def test_reunion_can_print_summary
    skip
    reunion = Reunion.new("Denver")
    act = Activity.new("Brunch")
    act.add_participant("Jim", 20)
    act.add_participant("Joe", 40)
    act_2 = Activity.new("Drinks")
    act_2.add_participant("Jim", 60)
    act_2.add_participant("John", 80)
    reunion.add_activity(act)
    reunion.add_activity(act_2)


  end

end

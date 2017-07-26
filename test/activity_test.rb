require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_activity_exists
    activity = Activity.new("Brunch")

    assert_instance_of Activity, activity
  end

  def test_acitivity_has_name
    act = Activity.new("Brunch")

    assert_equal "Brunch", act.name
  end

  def test_activity_has_no_participants_at_start
    act = Activity.new("Brunch")

    assert_equal ({}), act.participants
  end

  def test_activity_can_add_participants
    act = Activity.new("Brunch")
    act.add_participant("Jim", 20)

    assert_equal 1, act.participants.count
  end

  def test_activity_can_check_total_cost
    act = Activity.new("Brunch")
    act.add_participant("Jim", 20)

    assert_equal 20, act.total_cost
  end

  def test_activity_can_have_multiple_participants
    act = Activity.new("Brunch")
    act.add_participant("Jim", 20)

    assert_equal 1, act.participants.count
    assert_equal 20, act.total_cost

    act.add_participant("Joe", 40)

    assert_equal 2, act.participants.count
    assert_equal 60, act.total_cost
  end

  def test_activity_can_split_total_cost
    act = Activity.new("Brunch")
    act.add_participant("Jim", 20)
    act.add_participant("Joe", 40)

    assert_equal 30, act.split
  end

  def test_activity_can_calc_amount_owed_by_participants
    act = Activity.new("Brunch")
    act.add_participant("Jim", 20)
    act.add_participant("Joe", 40)

    assert_equal ({"Jim" => 10, "Joe" => -10}), act.owed
  end

end

require File.expand_path('../../test_helper', __FILE__)

class RedmineHolidaysTest < ActiveSupport::TestCase
  test "check holiday" do
    assert RedmineHolidays.holiday?(Time.zone.local(2021, 1, 1))
    assert_not RedmineHolidays.holiday?(Time.zone.local(2021, 1, 2))
  end

  test "returns all holiday" do
    holiday_names = RedmineHolidays.in(Time.zone.local(2021, 1, 1)).map(&:name)
    assert_equal holiday_names, ["Tết Tây", "元日"]
  end

  test "returns empty if no holidays" do
    holidays = RedmineHolidays.in(Time.zone.local(2021, 1, 2))
    assert_equal holidays, []
  end
end

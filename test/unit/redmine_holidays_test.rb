require File.expand_path('../../test_helper', __FILE__)

class RedmineHolidaysTest < ActiveSupport::TestCase
  def setup
    Holiday.create(name: "Tết Tây", date: "2021-01-01", country: :vn)
    Holiday.create(name: "元日", date: "2021-01-01", country: :jp)
  end

  test ".holiday?" do
    assert RedmineHolidays.holiday?(Time.zone.local(2021, 1, 1))
    assert_not RedmineHolidays.holiday?(Time.zone.local(2021, 1, 2))
  end

  test ".in returns results" do
    holiday_names = RedmineHolidays.in(Time.zone.local(2021, 1, 1)).map(&:name)
    assert_equal holiday_names, ["Tết Tây", "元日"]
  end

  test ".in return empty" do
    holidays = RedmineHolidays.in(Time.zone.local(2021, 1, 2))
    assert_equal holidays, []
  end

  test "#holiday?" do
    holidays_manager = RedmineHolidays.new(Time.zone.local(2021, 1, 1), Time.zone.local(2021, 1, 31))
    assert holidays_manager.holiday?(Time.zone.local(2021, 1, 1))
    assert_not holidays_manager.holiday?(Time.zone.local(2021, 1, 2))
  end

  test "#in" do
    holidays_manager = RedmineHolidays.new(Time.zone.local(2021, 1, 1), Time.zone.local(2021, 1, 31))
    holiday_names = holidays_manager.in(Time.zone.local(2021, 1, 1)).map(&:name)
    assert_equal holiday_names, ["Tết Tây", "元日"]
  end
end

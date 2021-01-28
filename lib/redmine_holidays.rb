class RedmineHolidays
  include Singleton

  def self.holiday?(date)
    instance.holidays.holiday?(date)
  end

  def self.in(date)
    instance.holidays.in(date)
  end

  def holidays
    @holidays ||= ::RedmineHolidays::Holidays.new
  end
end

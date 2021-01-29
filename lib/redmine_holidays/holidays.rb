require "yaml"

class RedmineHolidays::Holidays
  attr_accessor :holidays

  def initialize(start_date, end_date)
    load(start_date, end_date)
  end

  def holiday?(date)
    holidays.has_key?(date.to_date)
  end

  def in(date)
    holidays[date.to_date] || []
  end

  def load(start_date, end_date)
    self.holidays = {}
    Holiday.where("date BETWEEN ? AND ?", start_date, end_date).each do |holiday|
      self.holidays[holiday.date.to_date] ||= []
      self.holidays[holiday.date.to_date].push(holiday)
    end
  end
end

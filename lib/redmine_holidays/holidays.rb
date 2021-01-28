require "yaml"

class RedmineHolidays::Holidays
  attr_accessor :holidays

  def initialize
    self.holidays = {}
    load_holidays
  end

  def load_holidays
    data_files = Dir[File.expand_path("../*.yml" ,__FILE__)]
    data_files.each do |filename|
      country = File.basename(filename, ".yml")
      holidays = YAML.load_file(filename)
      holidays.map do |date, name|
        self.holidays[date] ||= []
        holiday = RedmineHolidays::Holiday.new(date: date, name: name, country: country)
        self.holidays[date].push(holiday)
      end
    end

    HolidayJp.holidays.holidays.each do |date, holiday_jp|
      self.holidays[date] ||= []
      holiday = RedmineHolidays::Holiday.new(date: date, name: holiday_jp.name, country: :jp)
      self.holidays[date].push(holiday)
    end
  end

  def holiday?(date)
    holidays.has_key?(date.to_date)
  end

  def in(date)
    holidays[date.to_date] || []
  end
end

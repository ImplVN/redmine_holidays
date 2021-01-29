class RedmineHolidays::Parser::YamlParser
  attr_accessor :content, :filename

  def initialize(filename, content)
    self.filename = filename
    self.content = content
  end

  def parse
    country = File.basename(filename, ".yml")
    holidays = content
    i = 1
    holidays.map do |date, name|
      holiday = Holiday.new(date: date, name: name, country: country)
      yield holiday, i
      i += 1
    end
  end
end

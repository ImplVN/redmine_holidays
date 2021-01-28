class RedmineHolidays::Holiday
  attr_accessor :date, :name, :country

  def initialize(date:, name:, country:)
    self.date, self.name, self.country = date, name, country
  end
end

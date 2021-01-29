class RedmineHolidays
  extend Forwardable

  def_delegators :@holidays, :in, :holiday?

  def initialize(start_date, end_date)
    @holidays = ::RedmineHolidays::Holidays.new(start_date, end_date)
  end

  class << self
    def in(date)
      Holiday.where(date: date.to_date)
    end

    def holiday?(date)
      Holiday.where(date: date.to_date).exists?
    end
  end
end

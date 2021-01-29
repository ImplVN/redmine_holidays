class RedmineHolidays::ImportService
  attr_accessor :parser

  def initialize(parser)
    self.parser = parser
  end

  def perform!
    ActiveRecord::Base.transaction do
      errors = []

      parser.parse do |holiday, row_no|
        holiday.save!
      rescue ActiveRecord::RecordInvalid => e
        errors << ArgumentError.new(I18n.t("redmine_holidays.import_service.error", row_no: row_no, message: e.message))
      end

      raise ArgumentError.new(errors.map(&:message).join("\n")) if errors.any?
    end
  end
end

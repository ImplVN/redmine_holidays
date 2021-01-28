require_dependency 'calendars_helper'

module RedmineHolidays::CalendarsHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method :original_calendar_day_css_classes, :calendar_day_css_classes
      alias_method :calendar_day_css_classes, :calendar_day_css_classes_with_holiday
    end
  end

  module InstanceMethods
    def calendar_day_css_classes_with_holiday(calendar, day)
      css = original_calendar_day_css_classes(calendar, day)
      css << " calendar__day--holiday" if RedmineHolidays.holiday?(day)
      css
    end
  end
end

CalendarsHelper.send(:include, RedmineHolidays::CalendarsHelperPatch)

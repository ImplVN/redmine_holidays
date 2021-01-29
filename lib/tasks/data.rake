namespace :redmine_holidays do
  namespace :data do
    task import: :environment do
      data_files = Dir[File.expand_path("../*.yml" ,__FILE__)]
      data_files.each do |filename|
        parser = RedmineHolidays::Parser::YamlParser.new(filename, YAML.load_file(filename))
        RedmineHolidays::ImportService.new(parser).perform!
      end
    end

    task import_jp: :environment do
      require 'holiday_jp'

      HolidayJp.holidays.holidays.each do |date, holiday_jp|
        holiday = Holiday.new(date: date, name: holiday_jp.name, country: :jp)
        holiday.save!
      end
    end
  end
end

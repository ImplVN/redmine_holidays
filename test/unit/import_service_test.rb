require File.expand_path('../../test_helper', __FILE__)

class ImportServiceTest < ActiveSupport::TestCase
  test "import yaml successfully" do
    file = File.expand_path("../../fixtures/valid/vn.yml", __FILE__)
    parser = RedmineHolidays::Parser::YamlParser.new(file, YAML.load_file(file))
    RedmineHolidays::ImportService.new(parser).perform!
    assert_equal Holiday.count, 2
  end

  test "import yaml failed" do
    file = File.expand_path("../../fixtures/invalid/vn.yml", __FILE__)
    parser = RedmineHolidays::Parser::YamlParser.new(file, YAML.load_file(file))
    begin
      RedmineHolidays::ImportService.new(parser).perform!
    rescue StandardError => e
      assert_equal e.message, "Row 1: Validation failed: Name cannot be blank"
      assert_equal Holiday.count, 0
    end
  end
end

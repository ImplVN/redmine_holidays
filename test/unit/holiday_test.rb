require File.expand_path('../../test_helper', __FILE__)

class HolidayTest < ActiveSupport::TestCase
  def setup
    @locale = I18n.locale
    I18n.locale = :en
  end

  def teardown
    I18n.locale = @locale
  end

  test "#country_text" do
    assert_equal Holiday.new(country: :vn).country_text, "Vietnam"
    assert_equal Holiday.new.country_text, nil
  end
end

class RedmineHolidays::Hooks < Redmine::Hook::ViewListener
  render_on :view_layouts_base_html_head, partial: 'calendars/assets'

  render_on :view_calendar_issues_top, partial: 'calendars/holidays'
end

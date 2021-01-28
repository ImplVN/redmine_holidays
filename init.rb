require 'redmine_holidays/calendars_helper_patch'
require 'redmine_holidays/hooks'

Redmine::Plugin.register :redmine_holidays do
  name 'Redmine Holidays plugin'
  author 'Le Si Bich'
  description 'Holidays plugin for Redmine'
  version '1.0.1'
  url 'https://github.com/ImplVN/redmine_holidays'
  author_url 'https://github.com/moonlight8978'
end

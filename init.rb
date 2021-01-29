require 'redmine'
require 'redmine_holidays/hooks'

Redmine::Plugin.register :redmine_holidays do
  name 'Redmine Holidays plugin'
  author 'Le Si Bich'
  description 'Holidays plugin for Redmine'
  version '2.0.0'
  url 'https://github.com/ImplVN/redmine_holidays'
  author_url 'https://github.com/moonlight8978'

  settings default: {}, partial: 'holidays/settings'
end

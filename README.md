# Holidays support for Redmine calendar

![Example](https://user-images.githubusercontent.com/64468758/106099751-c5099080-616d-11eb-97b9-3dfc6c491e72.png)

- Code is inspired by [holiday_jp-ruby](https://github.com/holiday-jp/holiday_jp-ruby)

- Current support:
  - Vietnamese
  - Japanese (using `holiday_jp` gem)

#### Install

```bash
git clone https://github.com/ImplVN/redmine_holidays.git /path/to/redmine/plugins
RAILS_ENV=production bundle exec rails redmine:plugins:migrate
sudo systemctl restart <rails_server_service>
```

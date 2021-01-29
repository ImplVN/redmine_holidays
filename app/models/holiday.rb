class Holiday < ActiveRecord::Base
  extend Enumerize

  enumerize :country, in: [:jp, :vn]

  validates :name, :date, presence: true
end

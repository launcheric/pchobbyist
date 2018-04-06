class HardDrive < ApplicationRecord
  has_many :hd_counts
  has_many :builds, through: :hd_counts

  validates_presence_of :name, :manufacturer, :hdd_type, :capacity
  validates_presence_of :interface, :cache, :rpm, :form_factor
end

class VideoCard < ApplicationRecord
  has_many :builds

  validates_presence_of :name, :manufacturer, :interface, :chipset
  validates_presence_of :memory_size, :memory_type, :core_clock
  validates_presence_of :boost_clock, :thermal_design_power
end

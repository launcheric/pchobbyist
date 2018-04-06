class Cpu < ApplicationRecord
  has_many :builds
  
  validates_presence_of :name, :manufacturer, :data_width
  validates_presence_of :socket, :operating_frequency, :max_turbo_frequency
  validates_presence_of :cores, :lighography, :thermal_design_power
  validates_presence_of :cooler, :maximum_memory, :integrated_graphics
end

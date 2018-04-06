class CpuCooler < ApplicationRecord
  has_many :builds

  validates_presence_of :name, :manufacturer, :supported_sockets
  validates_presence_of :liquid_cooler
end

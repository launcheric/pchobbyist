class NetworkCard < ApplicationRecord
  has_many :builds

  validates_presence_of :name, :manufacturer, :interface
  validates_presence_of :protocols, :security
end

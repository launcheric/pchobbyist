class Tutorial < ApplicationRecord
  validates_presence_of :name, :url
end

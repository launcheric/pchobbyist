require 'rails_helper'

RSpec.describe VideoCard, type: :model do
  it { should have_valid(:name).when('Asus - GeForce GTX 1080 Ti 11GB STRIX GAMING Video Card') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:manufacturer).when('Asus') }
  it { should_not have_valid(:manufacturer).when(nil, '') }

  it { should have_valid(:interface).when('PCI-Express x16') }
  it { should_not have_valid(:interface).when(nil, '') }

  it { should have_valid(:chipset).when('GeForce GTX 1080 Ti') }
  it { should_not have_valid(:chipset).when(nil, '') }

  it { should have_valid(:memory_size).when('11GB') }
  it { should_not have_valid(:memory_size).when(nil, '') }

  it { should have_valid(:memory_type).when('GDDR5X') }
  it { should_not have_valid(:memory_type).when(nil, '') }

  it { should have_valid(:core_clock).when('1.57GHz') }
  it { should_not have_valid(:core_clock).when(nil, '') }

  it { should have_valid(:boost_clock).when('1.71GHz') }

  it { should have_valid(:thermal_design_power).when('250 Watts') }
  it { should_not have_valid(:thermal_design_power).when(nil, '') }
end

require 'rails_helper'

RSpec.describe Motherboard, type: :model do
  it { should have_valid(:name).when('Asus - ROG STRIX Z370-E GAMING ATX LGA1151 Motherboard') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:manufacturer).when('Asus') }
  it { should_not have_valid(:manufacturer).when(nil, '') }

  it { should have_valid(:form_factor).when('ATX') }
  it { should_not have_valid(:form_factor).when(nil, '') }

  it { should have_valid(:socket).when('LGA1151') }
  it { should_not have_valid(:socket).when(nil, '') }

  it { should have_valid(:chipset).when('Intel Z370') }
  it { should_not have_valid(:chipset).when(nil, '') }

  it { should have_valid(:memory_pin).when('288') }
  it { should_not have_valid(:memory_pin).when(nil, '') }

  it { should have_valid(:memory_slots).when('4') }
  it { should_not have_valid(:memory_slots).when(nil, '') }

  it { should have_valid(:memory_type).when('DDR4-2133 / 2400 / 2666 / 2800 / 3000 / 3200 / 3300 / 3333 / 3400 / 3466 / 3600 / 3733 / 3866 / 4000') }
  it { should_not have_valid(:memory_type).when(nil, '') }

  it { should have_valid(:maximum_memory).when('64 GB') }
  it { should_not have_valid(:maximum_memory).when(nil, '') }

  it { should have_valid(:raid_support).when('Yes') }
  it { should_not have_valid(:raid_support).when(nil, '') }
end

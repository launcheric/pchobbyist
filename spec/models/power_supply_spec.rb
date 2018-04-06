require 'rails_helper'

RSpec.describe PowerSupply, type: :model do
  it { should have_valid(:name).when('EVGA - SuperNOVA G3 650W 80+ Gold Certified Fully-Modular ATX Power Supply') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:manufacturer).when('EVGA') }
  it { should_not have_valid(:manufacturer).when(nil, '') }

  it { should have_valid(:psu_type).when('ATX') }
  it { should_not have_valid(:psu_type).when(nil, '') }

  it { should have_valid(:wattage).when('650 Watts') }
  it { should_not have_valid(:wattage).when(nil, '') }

  it { should have_valid(:modular).when('Full') }
  it { should_not have_valid(:modular).when(nil, '') }

  it { should have_valid(:efficiency_certification).when('80+ Gold') }
  it { should_not have_valid(:efficiency_certification).when(nil, '') }
end

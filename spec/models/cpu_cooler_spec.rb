require 'rails_helper'

RSpec.describe CpuCooler, type: :model do
  it { should have_valid(:name).when('Cooler Master - Hyper 212 EVO 82.9 CFM Sleeve Bearing CPU Cooler') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:manufacturer).when('Cooler Master') }
  it { should_not have_valid(:manufacturer).when(nil, '') }

  it { should have_valid(:supported_sockets).when('AM2, AM2+, AM3, AM3+, AM4, FM1, FM2, FM2+, LGA1150, LGA1151, LGA1155, LGA1156, LGA1366, LGA2011, LGA2011-3, LGA2066, LGA775') }
  it { should_not have_valid(:supported_sockets).when(nil, '') }

  it { should have_valid(:liquid_cooler).when('No') }
  it { should_not have_valid(:liquid_cooler).when(nil, '') }

  it { should have_valid(:bearing_type).when('Sleeve') }

  it { should have_valid(:noise_level).when('9.0 - 36.0 dbA') }

  it { should have_valid(:fan_rpm).when('600 - 2000 RPM') }

  it { should have_valid(:height).when('6.26" (159mm)') }

  it { should have_valid(:radiator_size).when('') }
end

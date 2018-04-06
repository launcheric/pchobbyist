require 'rails_helper'

RSpec.describe MemoryCard, type: :model do
  it { should have_valid(:name).when('GeIL - EVO POTENZA 4GB DDR4-2400 Memory') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:manufacturer).when('GeIL') }
  it { should_not have_valid(:manufacturer).when(nil, '') }

  it { should have_valid(:memory_type).when('288') }
  it { should_not have_valid(:memory_type).when(nil, '') }

  it { should have_valid(:speed).when('DDR4-2400') }
  it { should_not have_valid(:speed).when(nil, '') }

  it { should have_valid(:size).when('4') }
  it { should_not have_valid(:size).when(nil, '') }

  it { should have_valid(:cas_latency).when('15') }
  it { should_not have_valid(:cas_latency).when(nil, '') }

  it { should have_valid(:voltage).when('1.2V') }
  it { should_not have_valid(:voltage).when(nil, '') }

  it { should have_valid(:ecc).when('No') }
  it { should_not have_valid(:ecc).when(nil, '') }

  it { should have_valid(:registered).when('No') }
  it { should_not have_valid(:registered).when(nil, '') }
end

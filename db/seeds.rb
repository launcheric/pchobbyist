# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cpu.delete_all
Motherboard.delete_all
VideoCard.delete_all
MemoryCard.delete_all
HardDrive.delete_all
PowerSupply.delete_all
ComputerCase.delete_all
CpuCooler.delete_all
NetworkCard.delete_all
Build.delete_all
MemoryCount.delete_all
HdCount.delete_all
Comment.delete_all
Tutorial.delete_all

cpus = ActiveSupport::JSON.decode(File.read('db/seeds/cpus.json'))
computer_cases = ActiveSupport::JSON.decode(File.read('db/seeds/computer_cases.json'))
motherboards = ActiveSupport::JSON.decode(File.read('db/seeds/motherboards.json'))
hard_drives = ActiveSupport::JSON.decode(File.read('db/seeds/hard_drives.json'))
memory_cards = ActiveSupport::JSON.decode(File.read('db/seeds/memory_cards.json'))
network_cards = ActiveSupport::JSON.decode(File.read('db/seeds/network_cards.json'))
power_supplies = ActiveSupport::JSON.decode(File.read('db/seeds/power_supplies.json'))
video_cards = ActiveSupport::JSON.decode(File.read('db/seeds/video_cards.json'))
cpu_coolers = ActiveSupport::JSON.decode(File.read('db/seeds/cpu_coolers.json'))
tutorials = ActiveSupport::JSON.decode(File.read('db/seeds/tutorials.json'))

cpus.each do |cpu|
  Cpu.create!(
    name: cpu["name"],
    manufacturer: cpu["manufacturer"],
    data_width: cpu["data_width"],
    socket: cpu["socket"],
    operating_frequency: cpu["operating_frequency"],
    max_turbo_frequency: cpu["max_turbo_frequency"],
    cores: cpu["cores"],
    lighography: cpu["lighography"],
    thermal_design_power: cpu["thermal_design_power"],
    cooler: cpu["cooler"],
    maximum_memory: cpu["maximum_memory"],
    integrated_graphics: cpu["integrated_graphics"]
  )
end

computer_cases.each do |computer_case|
  ComputerCase.create!(
    name: computer_case["name"],
    manufacturer: computer_case["manufacturer"],
    case_type: computer_case["case_type"],
    power_supply: computer_case["power_supply"],
    small_bay: computer_case["small_bay"],
    medium_bay: computer_case["medium_bay"],
    compatibility: computer_case["compatibility"]
  )
end

motherboards.each do |motherboard|
  Motherboard.create!(
    name: motherboard["name"],
    manufacturer: motherboard["manufacturer"],
    form_factor: motherboard["form_factor"],
    socket: motherboard["socket"],
    chipset: motherboard["chipset"],
    memory_pin: motherboard["memory_pin"],
    memory_slots: motherboard["memory_slots"],
    memory_type: motherboard["memory_type"],
    maximum_memory: motherboard["maximum_memory"],
    raid_support: motherboard["raid_support"]
  )
end

hard_drives.each do |hard_drive|
  HardDrive.create!(
    name: hard_drive["name"],
    manufacturer: hard_drive["manufacturer"],
    hdd_type: hard_drive["hdd_type"],
    capacity: hard_drive["capacity"],
    interface: hard_drive["interface"],
    cache: hard_drive["cache"],
    rpm: hard_drive["rpm"],
    form_factor: hard_drive["form_factor"]
  )
end

cpu_coolers.each do |cpu_cooler|
  CpuCooler.create!(
    name: cpu_cooler["name"],
    manufacturer: cpu_cooler["manufacturer"],
    supported_sockets: cpu_cooler["supported_sockets"],
    liquid_cooler: cpu_cooler["liquid_cooler"],
    bearing_type: cpu_cooler["bearing_type"],
    noise_level: cpu_cooler["noise_level"],
    fan_rpm: cpu_cooler["fan_rpm"],
    height: cpu_cooler["height"],
    radiator_size: cpu_cooler["radiator_size"]
  )
end

video_cards.each do |video_card|
  VideoCard.create!(
    name: video_card["name"],
    manufacturer: video_card["manufacturer"],
    interface: video_card["interface"],
    chipset: video_card["chipset"],
    memory_size: video_card["memory_size"],
    memory_type: video_card["memory_type"],
    core_clock: video_card["core_clock"],
    boost_clock: video_card["boost_clock"],
    thermal_design_power: video_card["thermal_design_power"]
  )
end

memory_cards.each do |memory_card|
  MemoryCard.create!(
    name: memory_card["name"],
    manufacturer: memory_card["manufacturer"],
    memory_type: memory_card["memory_type"],
    speed: memory_card["speed"],
    size: memory_card["size"],
    cas_latency: memory_card["cas_latency"],
    voltage: memory_card["voltage"],
    ecc: memory_card["ecc"],
    registered: memory_card["registered"]
  )
end

power_supplies.each do |power_supply|
  PowerSupply.create!(
    name: power_supply["name"],
    manufacturer: power_supply["manufacturer"],
    psu_type: power_supply["psu_type"],
    wattage: power_supply["wattage"],
    modular: power_supply["modular"],
    efficiency_certification: power_supply["efficiency_certification"]
  )
end

network_cards.each do |network_card|
  NetworkCard.create!(
    name: network_card["name"],
    manufacturer: network_card["manufacturer"],
    interface: network_card["interface"],
    protocols: network_card["protocols"],
    security: network_card["security"]
  )
end

User.create!(
  email: "cpumonster@gmail.com",
  password: "pw1234",
  username: "CPUmonster"
)

4.times do
    Build.create!(
    user: User.first,
    name: "My First Build",
    description: "This is super cool!",
    computer_case: ComputerCase.first,
    cpu_cooler_id: "",
    cpu: Cpu.first,
    motherboard: Motherboard.first,
    network_card_id: "",
    power_supply: PowerSupply.first,
    video_card_id: "",
    image_url: ""
  )
    Build.create!(
    user: User.first,
    name: "My Second Build",
    description: "This is super cool!",
    computer_case: ComputerCase.last,
    cpu_cooler_id: "",
    cpu: Cpu.last,
    motherboard: Motherboard.last,
    network_card_id: "",
    power_supply: PowerSupply.last,
    video_card_id: "",
    image_url: ""
  )
end

MemoryCount.create!(
  memory_card: MemoryCard.last,
  build: Build.last
)
MemoryCount.create!(
  memory_card: MemoryCard.first,
  build: Build.first
)
HdCount.create!(
  hard_drive: HardDrive.last,
  build: Build.last
)
HdCount.create!(
  hard_drive: HardDrive.first,
  build: Build.first
)
Comment.create!(
  user: User.first,
  build: Build.first,
  body: "This was an interesting build!"
)


tutorials.each do |tutorial|
  Tutorial.create!(
    name: tutorial["name"],
    url: tutorial["url"]
  )
end

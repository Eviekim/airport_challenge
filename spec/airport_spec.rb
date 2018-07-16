require 'airport'

describe Airport do

  let(:plane) {Plane.new}
  it 'responds to a plane' do
    expect(subject).to eq plane
    expect(subject).to respond_to :plane
  end
end

# landing
  it 'has the right to allow a plane to land' do
    #plane = Plane.new (not needed)
    expect(subject).to respond_to(:land).with(1).argument
    expect(subject.land(plane)).to eq(plane)
  end

# preventing plane from prevent_landing
 it 'has the right to prohibit planes from landing due to stormy weather' do
   #plane = Plane.new
   allow(subject).to revieve(:weather).and_return(:stormy)
   subject.land(plane)
   expect(subject.land(plane)).to raise_error("landing is not available due to this bad weather")
 end

# Taking off
 it 'has the right to take off plane' do
   #plane = Plane.new (not needed)
   expect(subject).to respond_to(:takeoff).with(1).argument
   expect(subject.takeoff(plane))
 end

 # leaving airport
  it 'plane can leave the airport' do
    #plane = Plane.new
    expect(subject.leave(plane)).to eq("you just left")
  end

  # preventing plane from prevent_takingoff
  it 'has the right to prohibit planes from takingoff due to stormy weather' do
    #plane = Plane.new (not needed)
    allow(subject).to revieve(:weather).and_return(:stormy)
    subject.takeoff(plane)
    expect(subject.takeoff(plane)).to raise_error("takingoff is not available due to this bad weather")
  end

  # airport is too busy - not allow to land
  it 'not allow plane to land because the airport is too busy' do
    subject.airport_busy? do
      #plane = Plane.new (not needed)
      expect(subject.land(plane)).to raise_error("you can't land now - airport is too busy")
    end
  end

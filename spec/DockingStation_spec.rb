require 'DockingStation'

describe DockingStation do
	it { is_expected.to respond_to :release_bike }

    
    it {is_expected.to respond_to(:dock).with(1).argument }

  	# it {is_expected.to respond_to (:bike)}

    it 'does not release a bike if no bikes available' do
    expect {subject.release_bike}.to raise_error("No bikes available")
    end
  let(:bike) { double :bike }
  it 'releases working bikes' do
    #allow(bike).to receive(:working?).and_return(true)
    bike = double(:bike, working?: true)
    expect(bike).to be_working
  end 

    
   it 'cannot dock bikes' do
   DockingStation::DEFAULT_CAPACITY.times{subject.dock(double(:bike))}
   expect { subject.dock(double(:bike)) }.to raise_error("No more spaces for bikes")
  
end 

   it 'has a capacity' do
   expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
end 

  it 'does not release broken bikes' do
    bike = double(:bike)
    #bike.report_broken
    #allow(bike).to receive(:broken?).and_return(true)
    bike = double(:bike, broken?: true)
    subject.dock(bike)
    expect {subject.release_bike}.to raise_error "ERROR: Broken Bike"
  end 
  
end


    #RAISED ERRORS (NOT SURE IF STILL RELEVANT TO TEST)
    
    #it 'remembers a bike' do 
    # bike = Bike.new
    # expect(subject.dock(bike)).to eq bike


    #it 'reports a bike' do 
    # bike = Bike.new
    # subject.dock(bike)
    # expect(subject.bike).to eq bike
    # end 
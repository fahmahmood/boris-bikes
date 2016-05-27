require 'Bike'

describe Bike do
	it { is_expected.to respond_to :working? }


	it { is_expected.to respond_to :report_broken }


	it 'can be reported broken' do
		subject.report_broken
		expect(subject).to be_broken
	end 
end 



require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase

	test "that creating and appointment works" do

		appointment = Appointment.new(:company => "Ziogama")
		assert appointment.save

	end

end

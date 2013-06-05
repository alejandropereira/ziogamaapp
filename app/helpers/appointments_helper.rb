module AppointmentsHelper
	def state(state)

		if state == true
			content_tag :label, :class => "label label-success" do 
			  "Finalizada"
			end
		else 
			content_tag :label, :class => "label label-important" do 
			  "En Proceso"
			end
		end

	end
end

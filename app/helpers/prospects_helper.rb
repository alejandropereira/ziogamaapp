module ProspectsHelper

	def day_goal
		prospects_today = current_user.prospects.today.count ||= 0
		prospects_left = 40 - prospects_today

		prospects_left = 0 if prospects_left < 0

		"Le hacen falta #{prospects_left} prospectos para cumplir su meta diaria"
	end

	def interes(state)

		if state == true
			content_tag :label, :class => "label label-success" do 
			  "Interesado"
			end
		else 
			content_tag :label, :class => "label label-important" do 
			  "No Interesado"
			end
		end

	end

	def quote(status)
		if status == true
			content_tag :label, :class => "label label-success" do 
			  "Cotizado"
			end
		else 
			content_tag :label, :class => "label label-important" do 
			  "No Cotizado"
			end
		end
	end

	def complete(complete)
		if complete == true
			content_tag :label, :class => "label label-success" do 
			  "Completo"
			end
		else 
			content_tag :label, :class => "label label-important" do 
			  "No Completo"
			end
		end		
	end

end

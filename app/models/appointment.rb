class Appointment < ActiveRecord::Base
  attr_accessible :company, :details, :finished_at, :status, :user_id
  belongs_to :user

  before_create :update_status


  def self.chart_data(start = 1.weeks.ago)
	  total_prices = appointments_by_day(start)
	  (start.to_date..Date.today).map do |date|
	    {
	      created_at: date,
	      countdate: total_prices[date] || 0
	    }
	  end
	end

	def self.appointments_by_day(start)
		prospects = where(created_at: start.beginning_of_day..Time.zone.now)
		prospects = group("date(finished_at)").select("finished_at, count(finished_at) as count")
	  prospects.each_with_object({}) do |prospect, argu|
	    argu[prospect.finished_at.to_date] = prospect.count
	  end

	end

  private

  def update_status
  	self.status = false
  	true
  end
end

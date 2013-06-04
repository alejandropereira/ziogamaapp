class Prospect < ActiveRecord::Base
  attr_accessible :address, :comments, :company, :email, :name, 
  				  :phone, :product, :state, :status, :complete
  				  
  belongs_to :user
  scope :today, lambda{ where("DATE(created_at) = DATE(?)", Date.today) }
  scope :this_week, lambda { where("created_at >= :start_date AND created_at <= :end_date", {:start_date => Date.today.at_beginning_of_week, :end_date => Date.today.at_end_of_week(start_day = :sunday) }) } 

  def self.chart_data(start = 1.weeks.ago)
	  total_prices = prospects_by_day(start)
	  (start.to_date..Date.today).map do |date|
	    {
	      created_at: date,
	      countdate: total_prices[date] || 0
	    }
	  end
	end

	def self.prospects_by_day(start)
		prospects = where(created_at: start.beginning_of_day..Time.zone.now)
		prospects = group("date(created_at)").select("created_at, count(created_at) as count")
	  prospects.each_with_object({}) do |prospect, argu|
	    argu[prospect.created_at.to_date] = prospect.count
	  end

	end
end

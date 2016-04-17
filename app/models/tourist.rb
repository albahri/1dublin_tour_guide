class Tourist < ActiveRecord::Base
	def self.search(search)
		where("lastname LIKE ?", "%#{search}%")
	end
end

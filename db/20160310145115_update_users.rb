class UpdateUsers < ActiveRecord::Migration
  def change

  	@u = User.find_by( email: 'admin2@email.com')
  	@u.update_attribute :admin, true
  end
end

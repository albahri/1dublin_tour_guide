class UpdateUsers < ActiveRecord::Migration
  def change
  	@u = User.create(email: 'admin@email.com', username: 'admin'))

  	@u = User.find_by( email: 'admin@email.com')
  	@u.update_attribute :admin, true
  end
end

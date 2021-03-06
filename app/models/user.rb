class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   
   #Setup accessible (or protected) attributes for you model
   #attr_accessible :email, :password, :password_confirmation, :remember_me, :username

   #validates_presence_of :username
   has_one :profile
end

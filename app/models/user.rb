class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :school

  attr_accessor :school_name, :school_role, :full_name

  def full_name
  	[self.first_name, self.last_name].join(' ')
  end
  
end
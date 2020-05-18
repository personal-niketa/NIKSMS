class AddSchoolRefToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_reference :users, :school, index: true
  end
end

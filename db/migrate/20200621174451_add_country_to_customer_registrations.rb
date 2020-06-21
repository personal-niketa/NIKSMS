class AddCountryToCustomerRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :customer_registrations, :country, :text
  end
end

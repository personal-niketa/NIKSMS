class CreateCustomerRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_registrations do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.integer :hobby
      t.integer :source_of_hearing
      t.timestamps
    end
  end
end

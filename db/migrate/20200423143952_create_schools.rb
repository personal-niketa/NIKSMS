class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.text :person_name
      t.text :school_name
      t.text :contact_email
      t.text :contact_number
      t.boolean :email_verified, default: false
      t.timestamps
    end
  end
end

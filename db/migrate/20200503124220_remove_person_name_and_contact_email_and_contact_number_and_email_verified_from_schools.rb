class RemovePersonNameAndContactEmailAndContactNumberAndEmailVerifiedFromSchools < ActiveRecord::Migration[5.2]
  def change
    remove_column :schools, :person_name, :text
    remove_column :schools, :contact_email, :text
    remove_column :schools, :contact_number, :text
    remove_column :schools, :email_verified, :boolean
  end
end

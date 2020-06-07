class AddAdmissionNumberToAdmissions < ActiveRecord::Migration[5.2]
  def change
    add_column :admissions, :admission_number, :string
  end
end
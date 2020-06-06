class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.text :name
      t.text :email
      t.datetime :dob
      t.text :gender
      t.text :father_name
      t.text :mother_name
      t.text :contact_no
      t.text :address
      t.timestamps
    end
  end
end

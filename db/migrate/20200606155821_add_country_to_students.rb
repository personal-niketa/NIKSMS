class AddCountryToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :country, :text
  end
end

class AddAddressAndBoardToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :address, :text
    add_column :schools, :board, :text
  end
end
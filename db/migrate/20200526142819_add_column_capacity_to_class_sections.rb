class AddColumnCapacityToClassSections < ActiveRecord::Migration[5.2]
  def change
    add_column :class_sections, :capacity, :integer, default: 0
  end
end
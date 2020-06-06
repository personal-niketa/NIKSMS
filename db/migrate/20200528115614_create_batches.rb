class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.text :batch_name
      t.timestamps
    end
  end
end

class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :name
      t.integer :url_id
      
      t.timestamps
    end
  end
end

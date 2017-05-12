class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :tag_type
      t.integer :url_id

      t.timestamps
    end
  end
end

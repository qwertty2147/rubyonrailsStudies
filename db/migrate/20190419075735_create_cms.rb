class CreateCms < ActiveRecord::Migration[5.1]
  def change
    create_table :cms do |t|
      t.string :name
      t.text :body
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
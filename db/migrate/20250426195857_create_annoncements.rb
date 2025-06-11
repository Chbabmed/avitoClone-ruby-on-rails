class CreateAnnoncements < ActiveRecord::Migration[8.0]
  def change
    create_table :annoncements do |t|
      t.string :title
      t.string :description
      t.string :type
      t.decimal :price
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

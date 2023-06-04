class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :link, null: false
      t.string :image_url
      t.decimal :cost, null: false
      t.string :ref
      t.boolean :splittable, default: false
      t.boolean :bought, default: false

      t.timestamps
    end
  end
end

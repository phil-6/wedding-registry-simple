class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :link, null: false
      t.string :image_url
      t.decimal :value, null: false
      t.string :ref
      t.boolean :bought, default: false
      t.string :bought_by
      t.text :bought_message

      t.timestamps
    end
  end
end

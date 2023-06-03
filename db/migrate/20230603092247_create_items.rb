class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :link
      t.decimal :value
      t.string :ref
      t.boolean :bought
      t.string :bought_by
      t.string :bought_message

      t.timestamps
    end
  end
end

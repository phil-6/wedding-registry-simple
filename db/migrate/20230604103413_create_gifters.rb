class CreateGifters < ActiveRecord::Migration[7.0]
  def change
    create_table :gifters do |t|
      t.belongs_to :gift, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.text :message
      t.decimal :contribution

      t.timestamps
    end
  end
end

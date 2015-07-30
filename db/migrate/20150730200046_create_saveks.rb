class CreateSaveks < ActiveRecord::Migration
  def change
    create_table :saveks do |t|
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.float :latitude
      t.float :longitude
      t.float :radius
      t.float :avg_rating
      t.integer :ratings
      t.string :gender
      t.text :address
      t.string :phone

      t.timestamps null: false
    end
  end
end

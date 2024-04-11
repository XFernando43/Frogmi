class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.float :mag
      t.string :place
      t.string :time
      t.string :url
      t.integer :tsunami
      t.string :mag_type
      t.string :title
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
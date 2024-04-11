class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      # t.string :Reportid
      t.float :mag
      t.string :place
      t.string :time
      t.string :Long
      t.string :Integer
      t.string :url
      t.integer :tsunami
      t.string :magType
      t.string :title
      t.string :string
      t.string :longitude
      t.string :float
      t.float :latitude

      t.timestamps
    end
  end
end

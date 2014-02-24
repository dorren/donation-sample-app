class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :contact_name
      t.string :latitude
      t.string :longitude
      t.references :donation, index: true

      t.timestamps
    end
  end
end

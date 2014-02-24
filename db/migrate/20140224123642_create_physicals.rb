class CreatePhysicals < ActiveRecord::Migration
  def change
    create_table :physicals do |t|
      t.integer :length
      t.integer :width
      t.integer :height
      t.integer :weight
      t.references :donation, index: true

      t.timestamps
    end
  end
end

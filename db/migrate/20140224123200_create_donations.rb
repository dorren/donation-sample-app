class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :title
      t.string :description
      t.references :user
      t.references :detail, polymorphic: true

      t.timestamps
    end
  end
end

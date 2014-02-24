class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.date :expires_at
      t.references :donation, index: true

      t.timestamps
    end
  end
end

class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.string :period
      t.date :date
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end
  end
end

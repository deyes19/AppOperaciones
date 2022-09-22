class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.date :date_buy
      t.text :pricebuy

      t.timestamps
    end
  end
end

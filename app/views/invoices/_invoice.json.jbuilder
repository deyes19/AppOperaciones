json.extract! invoice, :id, :date_buy, :pricebuy, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)

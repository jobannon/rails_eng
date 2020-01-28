require 'csv'

desc "Imports a CSV file into an ActiveRecord table"

namespace :import do 
  task merchants_import: :environment do    
    CSV.foreach("./data/merchants.csv", :headers => true) do |row|
        Merchant.create!(row.to_hash)
      end
  end

  task items_import: :environment do 
    CSV.foreach("./data/items.csv", :headers => true) do |row|
      Item.create!(row.to_hash)
    end
  end

  task customers_import: :environment do 
    CSV.foreach("./data/customers.csv", :headers => true) do |row|
      Customer.create!(row.to_hash)
    end
  end

  task invoices_import: :environment do 
    CSV.foreach("./data/invoices.csv", :headers => true) do |row|
      Invoice.create!(row.to_hash)
    end
  end

  task invoice_item_import: :environment do 
    CSV.foreach("./data/invoice_items.csv", :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
    end
  end

  task transactions_import: :environment do 
    CSV.foreach("./data/transactions.csv", :headers => true) do |row|
      Transaction.create!(row.to_hash)
    end
  end

  task all_import: :environment do  

    #remove previous
    Merchant.destroy_all
    Item.destroy_all
    Customer.destroy_all
    Invoice.destroy_all
    InvoiceItem.destroy_all
    Transaction.destroy_all

    CSV.foreach("./data/merchants.csv", :headers => true) do |row|
        Merchant.create!(row.to_hash)
    end

    CSV.foreach("./data/items.csv", :headers => true) do |row|
      Item.create!(row.to_hash)
    end

    CSV.foreach("./data/customers.csv", :headers => true) do |row|
      Customer.create!(row.to_hash)
    end

    CSV.foreach("./data/invoices.csv", :headers => true) do |row|
      Invoice.create!(row.to_hash)
    end

    CSV.foreach("./data/invoice_items.csv", :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
    end

    CSV.foreach("./data/transactions.csv", :headers => true) do |row|
      Transaction.create!(row.to_hash)
    end
  end

end

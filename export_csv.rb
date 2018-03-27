require 'csv'
require 'json'
require './gen.rb'

def export_wallets_to_csv
  start_time = Time.now
  count = 0
  data = read_wallets_json_file
  wallets = data["wallets"]
  total = wallets.count

  file_name = "./output/wallets_#{Time.now.to_i}.csv"

  CSV.open(file_name, "wb") do |csv|
    csv << ["count", "address", "amount"] if count == 0
    wallets.each do |item|
      puts "#{count}/#{total}"
      csv << ["#{count}", "#{item["address"]}", "0"]
      count = count + 1
    end
  end

  puts "\nProcessing completed! in #{Time.now - start_time}"
end

export_wallets_to_csv

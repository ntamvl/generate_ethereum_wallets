require 'dotenv/load'
require 'json'
require 'ethereum'

IPC_PATH = "#{ENV["ETHER_HOME"]}/geth.ipc"
IPC_HOST = ENV["ETHER_HOST"]
KEYSTORE_PATH = "#{ENV["ETHER_HOME"]}/keystore"
WALLET_PASSWORD = ENV["WALLET_PASSWORD"]
MAX_WALLET_COUNT = ENV["MAX_WALLET_COUNT"].to_i

puts "IPC PATH: #{IPC_PATH}"
puts "MAX_WALLET_COUNT: #{MAX_WALLET_COUNT}"
puts "WALLET_PASSWORD: #{WALLET_PASSWORD}"

class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end
end

def read_wallets_json_file
  wallets_file_path = "output/wallets.json"
  begin
    json_file = File.read(wallets_file_path)
    return nil if File.empty?(wallets_file_path) || json_file.nil? || json_file.to_s.blank?
    data = JSON.parse(json_file)
    return data
  rescue Exception => e
    puts "Error in reading #{wallets_file_path}. #{e.to_s}"
    return nil
  end
end

def write_wallets_json_file(item = nil)
  wallets_file_path = "output/wallets.json"
  begin
    data = read_wallets_json_file
    data = { "wallets" => [] } if data.nil?
    data["wallets"] << item if !item.nil?
    File.open(wallets_file_path, "w") do |f|
      f.write(JSON.pretty_generate(data))
    end
  rescue Exception => e
    puts "Error in writing #{wallets_file_path}. #{e.to_s}"
    return nil
  end
end

def generate_new_wallet(index = 0)
  puts "Starting generating ethereum wallet #{index}..."
  client = Ethereum::IpcClient.new(IPC_PATH, false)
  gas_price = client.eth_gas_price["result"].hex
  password = WALLET_PASSWORD

  account = client.personal_new_account(password)
  data = { password: password, address: account["result"], jsonrpc: account }
  write_wallets_json_file(data)
  puts "\n\n"
  data
end

def process_generating_wallets
  MAX_WALLET_COUNT.times.each do |index|
    generate_new_wallet(index)
  end
end

process_generating_wallets

# for testing
# MAX_WALLET_COUNT.times.each do |index|
#   item = { address: SecureRandom.hex(16), password: WALLET_PASSWORD }
#   write_wallets_json_file(item)
# end

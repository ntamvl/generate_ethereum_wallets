require './lib.rb'

process_generating_wallets

# for testing
# MAX_WALLET_COUNT.times.each do |index|
#   item = { address: SecureRandom.hex(16), password: WALLET_PASSWORD }
#   write_wallets_json_file(item)
# end

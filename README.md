# Generate Ethereum Wallets

## Need to install
- rbenv
- Ruby 2.4.3
- Ethereum Wallets

## Install rbenv and Ruby 2.4.3
**on macOS:**
```bash
brew install rbenv ruby-build

# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

# Install Ruby
rbenv install 2.4.3
rbenv global 2.4.3
ruby -v
```

**on Ubuntu:**
```bash
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.4.3
rbenv global 2.4.3
ruby -v
```

The last step is to install Bundler
```bash
gem install bundler
```
rbenv users need to run rbenv rehash after installing bundler.


## How to run
**Clone source and install dependencies:**
```bash
cd
git clone https://github.com/ntamvl/generate_ethereum_wallets.git
cd generate_ethereum_wallets
bundle install
```

**update `.env` config***
```
ETHER_HOME=/Users/tamnguyen/Library/Ethereum
ETHER_HOST=http://127.0.0.1:8545
MAX_WALLET_COUNT=2
WALLET_PASSWORD=your_wallet_password
```

explain variable in `.env`:
- ETHER_HOME: home folder of Ethereum Wallets
- ETHER_HOST: address of ethereum jsonrpc
- MAX_WALLET_COUNT: number of wallets to generate
- WALLET_PASSWORD: wallets password

**run:**
```bash
chmod +x start.sh
./start.sh
```


Enjoy :D


# README


## Prerequest

Ruby on rails must be installed. If not, Please install by [this](https://gorails.com/setup/ubuntu/20.04)

## Step to Setup

* $ git clone git@github.com:rajatrkgupta/account_api.git

* $ cd account_api

* $ rbenv install 3.0.4

* $ gem install bundler

* $ bundle install

* Change database.yml based on your credentials

* $ rails db:create

* $ rails db:migrate

* $ rails db:seed

## Testing

### By Terminal

curl --location --request POST 'https://auzmor-account.herokuapp.com/inbound/sms?from=91983435345&text=STOP&to=4924195509193' --header 'Authorization: Basic YXpyMToyMFMwS1BOT0lN'

### By Postman

* request_type: POST

* base_url: https://auzmor-account.herokuapp.com/

* params { to: "91983435345", to: "4924195509193", text: "STOP" }

* authorization { username: "azr1", password: "20S0KPNOIM" }

### By ruby script

* create a .rb file and paste this content
```
require "uri"
require "net/http"

url = URI("https://auzmor-account.herokuapp.com/inbound/sms?from=91983435345&text=STOP&to=4924195509193")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Authorization"] = "Basic YXpyMToyMFMwS1BOT0lN"

response = https.request(request)
puts response.read_body
```
* open terminal locate your file

* $ ruby your_file_name.rb
